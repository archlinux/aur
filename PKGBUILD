# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=youtrack
pkgver=2017.1.30973
pkgrel=1
pkgdesc='Issue tracker designed for development teams'
arch=('i686' 'x86_64')
license=('Commercial')
url='http://www.jetbrains.com/youtrack/'
depends=('java-runtime-headless')
backup=('etc/youtrack/youtrack.conf')
options=('!strip')
install=youtrack.install
source=(youtrack-${pkgver}.jar::https://download.jetbrains.com/charisma/${pkgname}-${pkgver}.jar
        youtrack.conf
        youtrack.service)
noextract=('youtrack.jar')
sha512sums=('09d389b8cc476c0cab69a48b2e0ec8fbe38074b60c3be7bc6d3a831aac9ea94bb975b33fbb711ced163609af99f1936ba95e358f0a85896b4489dc0740dc3266'
            'e9e14f7df2166d984d02c5150b0aa2032f28362abab457547a1ee4243722bd730612c11a957e203d784561802fe946d3b46298d93c6efbd3c0f6b3b6040305df'
            '9df3546e614d442bb55c6083fc35ac923d8b85126916effaced0ea14c1d5f7ab093d6f541ae6d3f03d6a5b547e3373743e175c7d0ac68828e8463bd09cf8f24b')

package() {
  install -d -m 700 ${pkgdir}/var/lib/youtrack/

  install -Dm755 ${srcdir}/youtrack-${pkgver}.jar ${pkgdir}/usr/share/youtrack/${pkgname}.jar
  install -Dm644 ${srcdir}/youtrack.conf ${pkgdir}/etc/youtrack/${pkgname}.conf
  install -Dm644 ${srcdir}/youtrack.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
