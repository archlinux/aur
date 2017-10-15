# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=youtrack
pkgver=2017.3.36743
pkgrel=1
pkgdesc='Issue tracker designed for development teams'
arch=('i686' 'x86_64')
url='http://www.jetbrains.com/youtrack/'
license=('Commercial')
depends=('java-runtime-headless')
backup=('etc/youtrack/youtrack.conf')
options=('!strip')
install=youtrack.install
source=(youtrack-${pkgver}.jar::https://download.jetbrains.com/charisma/${pkgname}-${pkgver}.jar
        youtrack.conf
        youtrack.service)
noextract=('youtrack.jar')
sha512sums=('8508125182dc2b9424cb5ba573b8239416215809963d72cc90ec44a9a5cf67a625ea45dd2329ef5f64d4728aab9730dfa0e801bf49a37561c590ce7b889cd5ed'
            '97d2c8ac07fd7903b82c2fc5beac33b38f13aa653f6684f00e40ead854af972a6f2bd2a179062ea27b14c9457aa48f68917acbb54a6a73372d5702a428d4843e'
            'c43c7ded853591ded84a5dff0e319de16fff4ec728b35cc5072b9832bb1a54bb6bb1454a6d75c0d34520f42d47022bbe6afecaf9bef7368f8a99d09fb3b24958')

package() {
  install -d -m 700 "${pkgdir}/var/lib/youtrack/"

  install -Dm755 "${srcdir}/youtrack-${pkgver}.jar" "${pkgdir}/usr/share/youtrack/${pkgname}.jar"
  install -Dm644 "${srcdir}/youtrack.conf" "${pkgdir}/etc/youtrack/${pkgname}.conf"
  install -Dm644 "${srcdir}/youtrack.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
