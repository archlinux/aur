# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=youtrack
pkgver=2017.1.31650
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
sha512sums=('57992f705e71a2657dea27285f7d550079a7230add2b6511dd84eed5b3c5d6ea5825a3f54b847552277eaac7d0513619a61614bd98852c4ad357d7c551fa33a0'
            'e9e14f7df2166d984d02c5150b0aa2032f28362abab457547a1ee4243722bd730612c11a957e203d784561802fe946d3b46298d93c6efbd3c0f6b3b6040305df'
            '2000e472332fba68b46daa20210b2dfd48def0a1089ebe4f865d33b06bafd87cc91ef28ac8f61e00f69f4cb689ebec33ab10aac6f467870fc15fdc4c422e8ec0')

package() {
  install -d -m 700 "${pkgdir}/var/lib/youtrack/"

  install -Dm755 "${srcdir}/youtrack-${pkgver}.jar" "${pkgdir}/usr/share/youtrack/${pkgname}.jar"
  install -Dm644 "${srcdir}/youtrack.conf" "${pkgdir}/etc/youtrack/${pkgname}.conf"
  install -Dm644 "${srcdir}/youtrack.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
