# Maintainer: h_asdf <aur@hasdf.de>
pkgname=jollacommunicator
pkgver=1.0.6
pkgrel=1
pkgdesc="control for jolla phones (contacts and sms)"
url="http://www.messaggiero.it/blogpost.php?id_images=8"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gambas3-runtime' 'gambas3-gb-image' 'gambas3-gb-qt4' 'gambas3-gb-form' 'gambas3-gb-settings' 'gambas3-gb-net' 'gambas3-gb-pcre' 'gambas3-gb-qt4-ext' 'gambas3-gb-form-stock') 
makedepends=()
conflicts=()
replaces=()
backup=()
bin1=data.tar.xz
source=("http://www.messaggiero.it/cimages/jollacomm/${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha1sums=('f1545131258d3430c88100d6bbb3fbb911644ae7')
INTEGRITY_CHECK=sha1
package() {
  ar vx  ${pkgname}_${pkgver}-${pkgrel}_all.deb
  tar -Jxf "${srcdir}/${bin1}"
  cd "${srcdir}/usr/bin"
  install -Dm755 "JollaCommunicator.gambas" "${pkgdir}/usr/bin/JollaCommunicator.gambas"
  cd "${srcdir}/usr/share/applications/"
  install -Dm644 "jollacommunicator.desktop" "${pkgdir}/usr/share/applications/jollacommunicator.desktop"
  cd "${srcdir}/usr/share/menu"
  install -Dm644 "jollacommunicator" "${pkgdir}/usr/share/menu/jollacommunicator"
  cd "${srcdir}/usr/share/pixmaps"
  install -Dm644 "jollacommunicator.png" "${pkgdir}/usr/share/pixmaps/jollacommunicator.png"
}
