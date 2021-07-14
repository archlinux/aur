# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=2.0.0
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')
conflicts=('paclog')

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('3df298e1410a156be21d5aca24e20f2fdbb3f6bda3203f76b84f9856a50482d2')

package() {
  cd "$pkgname-v$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/etc/bash_completion.d/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
