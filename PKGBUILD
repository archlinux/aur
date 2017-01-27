# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=youtrack
pkgver=7.0.29566
pkgrel=1
pkgdesc='Issue tracker designed for development teams'
arch=('i686' 'x86_64')
url='http://www.jetbrains.com/youtrack/'
license=('Commercial')
depends=('java-runtime-headless')
backup=('etc/youtrack/youtrack.conf')
options=('!strip')
install=youtrack.install
source=(youtrack.jar::https://download.jetbrains.com/charisma/${pkgname}-${pkgver}.jar
        youtrack.conf
        youtrack.service)
noextract=('youtrack.jar')
sha512sums=('9fd18f36730fc54934d846da37ccbcaa240cda88ed255b50bca23f4f392eb4233311f88c5a54a54b180c9dcd875a4a992e8ec43f15fac696fcea13122226458c'
            'e9e14f7df2166d984d02c5150b0aa2032f28362abab457547a1ee4243722bd730612c11a957e203d784561802fe946d3b46298d93c6efbd3c0f6b3b6040305df'
            '9df3546e614d442bb55c6083fc35ac923d8b85126916effaced0ea14c1d5f7ab093d6f541ae6d3f03d6a5b547e3373743e175c7d0ac68828e8463bd09cf8f24b')

package() {
  install -d -m 700 ${pkgdir}/var/lib/youtrack/

  install -Dm755 ${srcdir}/youtrack.jar ${pkgdir}/usr/share/youtrack/${pkgname}.jar
  install -Dm644 ${srcdir}/youtrack.conf ${pkgdir}/etc/youtrack/${pkgname}.conf
  install -Dm644 ${srcdir}/youtrack.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
