# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=1.2.0
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://github.com/protist/pacolog'
arch=('any')
license=('GPL3')
depends=('w3m')
conflicts=('paclog')

source=("https://github.com/protist/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0885dfd3c9b344b3961208765ec6defc7a2c3d6a510a6c4a349ce6ba28b08abd')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 completion/bash "${pkgdir}/etc/bash_completion.d/pacolog"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_pacolog"
}
