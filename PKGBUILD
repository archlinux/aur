# Maintainer: h_asdf <aur@hasdf.de>
pkgname=jollacommunicator
pkgver=2.0
pkgrel=1
pkgdesc="control for jolla phones (contacts and sms)"
url="http://www.messaggiero.it/blogpost.php?id_images=10"
arch=('x86_64')
license=('GPLv3')
depends=('java-runtime') 
makedepends=()
conflicts=()
replaces=()
backup=()
_bin1=data.tar.xz
source=("http://www.messaggiero.it/cimages/jollacomm/${pkgname}_${pkgver}_amd64.deb")
sha1sums=('543240acda6c724bc4dc7b76aeaf3caf7caf7087')
INTEGRITY_CHECK=sha1
package() {
  ar vx  ${pkgname}_${pkgver}_amd64.deb
  tar -Jxf "${srcdir}/${_bin1}"
  cd "${srcdir}/usr/bin"
  sed 's/\/usr\/lib\/jollacommunicator\/jre\/bin\/java/java/g' jollacommunicator > jollacommunicator.patched
  install -Dm755 "jollacommunicator.patched" "${pkgdir}/usr/bin/jollacommunicator"
  cd "${srcdir}/usr/share/applications/"
  install -Dm644 "Jolla_Communicator.desktop" "${pkgdir}/usr/share/applications/Jolla_Communicator.desktop"
  cd "${srcdir}/usr/share/doc/jollacommunicator"
  install -Dm644 "copyright" "${pkgdir}/usr/share/doc/jollacommunicator/copyright"
  install -Dm644 "jollacommunicator.png" "${pkgdir}/usr/share/doc/jollacommunicator/jollacommunicator.png"
  cd "${srcdir}/usr/lib/jollacommunicator"
  install -Dm644 "jollacommunicator.jar" "${pkgdir}/usr/lib/jollacommunicator/jollacommunicator.jar"
}
