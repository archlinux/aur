# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jumpapp
pkgver=1.2
pkgrel=1
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('any')
url="https://github.com/mkropat/jumpapp"
license=('MIT')
depends=('inetutils' 'wmctrl' 'xdotool')
source=("https://github.com/mkropat/jumpapp/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('794da8dc4a24b2cf9a380f6de4bbdcc8ad951aa92c9c2340cf1ffd5c939c6d9c')


package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} -t ${pkgdir}/usr/bin
  install -Dm755 jumpappify-desktop-entry -t "${pkgdir}/usr/bin"
  install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
