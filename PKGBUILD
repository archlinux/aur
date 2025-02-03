# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=2.2.1
pkgrel=3
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL-3.0-only')
depends=('w3m')

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9980b1ead56bdfdecf4f863b85591c56ee6aa5d699bfd9b1876e8daee3b4f899')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/usr/share/bash-completion/completions/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
