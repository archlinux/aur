# Contributor: Filipp Andjelo <scorp@mauilueberfall.de>

pkgname=universal-password-manager
pkgver=1.15.1
pkgrel=1
pkgdesc="Universal Password Manager"
arch=('any')
url="http://upm.sourceforge.net/"
depends=('java-runtime>=6')
license=("GPL")
source=(http://downloads.sourceforge.net/project/upm/upm-${pkgver}/upm-${pkgver}.tar.gz
        upm.sh upm.png upm.desktop)
md5sums=('9c83b4413ce5ef44e272cf44d0420569'
         '0f5aa8fe52fc3b8eed3d2fed4720131a'
         '1ef909f44ed71b629a78339fe566b4f8'
         '0cf9105552094b73ee2bce663642020d')

package() {

  # Create directories
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 -d ${pkgdir}/usr/share/upm/server/http
  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  install -m755 -d ${pkgdir}/usr/share/applications
  install -m755 -d ${pkgdir}/usr/share/doc/upm

  # Install files
  install -m644  ${srcdir}/upm-${pkgver}/README.txt ${pkgdir}/usr/share/doc/upm/.
  install -m644  ${srcdir}/upm-${pkgver}/*.jar ${pkgdir}/usr/share/upm
  install -m644  ${srcdir}/upm-${pkgver}/server/http/*.php ${pkgdir}/usr/share/upm/server/http
  install -m755  ${srcdir}/upm.sh ${pkgdir}/usr/bin/upm
  install -m644  ${srcdir}/upm.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  install -m644  ${srcdir}/upm.desktop ${pkgdir}/usr/share/applications
}
