# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=periodiccalendar
pkgver=3.4.0
pkgrel=1
pkgdesc="Periodic Calendar for tracking women cycle"
arch=('any')
url="http://linuxorg.sf.net/"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/linuxorg/files/PeriodicCalendar/pcalendar-3.4/pcalendar-$pkgver.jar
        $pkgname.desktop $pkgname.png)
md5sums=('b1403a54706d5612320e36fb79022e1c'
         '5b8490188ad00deea39cef729359d39d'
         'c26856c7a8a0045e8aa36f063563f67f')

package() {
  cd "${srcdir}"

  install -Dm644 "${srcdir}"/pcalendar-$pkgver.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar
  install -Dm644 "${srcdir}"/$pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop

#creating executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "java -jar /usr/share/java/$pkgname/$pkgname.jar" >> "${pkgdir}"/usr/bin/$pkgname
  chmod 755 "${pkgdir}"/usr/bin/$pkgname
}
