# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=youtrack
pkgver=2017.3.37116
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
sha512sums=('41b83386259fc5be25fc28986334c218754364eeb3c22058db387b7ce949c9606df25bc2091ae97bcc57c5c19f3f3e20f537641703a27667a2aa7d78c1d8d9e9'
            '97d2c8ac07fd7903b82c2fc5beac33b38f13aa653f6684f00e40ead854af972a6f2bd2a179062ea27b14c9457aa48f68917acbb54a6a73372d5702a428d4843e'
            'c43c7ded853591ded84a5dff0e319de16fff4ec728b35cc5072b9832bb1a54bb6bb1454a6d75c0d34520f42d47022bbe6afecaf9bef7368f8a99d09fb3b24958')

package() {
  install -d -m 700 "${pkgdir}/var/lib/youtrack/"

  install -Dm755 "${srcdir}/youtrack-${pkgver}.jar" "${pkgdir}/usr/share/youtrack/${pkgname}.jar"
  install -Dm644 "${srcdir}/youtrack.conf" "${pkgdir}/etc/youtrack/${pkgname}.conf"
  install -Dm644 "${srcdir}/youtrack.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
