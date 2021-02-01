# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jumpapp
pkgver=1.1
pkgrel=2
pkgdesc="A run-or-raise application switcher for any X11 desktop"
arch=('any')
url="https://github.com/mkropat/jumpapp"
license=('MIT')
depends=('inetutils' 'wmctrl' 'xdotool')
source=("https://github.com/mkropat/jumpapp/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('7ef5c616f845040382c6bebcdb8dc31d59f6a3a1bd01669842d02744596c40ec')


package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} -t ${pkgdir}/usr/bin
  install -Dm755 jumpappify-desktop-entry -t "${pkgdir}/usr/bin"
  install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm755 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
