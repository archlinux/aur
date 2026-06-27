# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=2.2.2
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL-3.0-only')
depends=('w3m')

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('20bb272a0b38afa54410bda46bcacbbbf7aa65033a519275088eb83063dd4ec0')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/usr/share/bash-completion/completions/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
