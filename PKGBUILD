# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=powbot
pkgver=latest
pkgrel=1
pkgdesc='A bot client for OldSchool RuneScape'
arch=('any')
url='https://powbot.org'
license=('custom')
depends=('java-runtime' 'bash')
noextract=("${pkgname}-${pkgver}.tar.gz")
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://powbot.org/game/PowBotLoader.jar"
        'LICENSE')
sha256sums=('SKIP' 'SKIP')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/powbot/powbot.jar' \"\$@\"" > "powbot"
  install -Dm755 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/powbot/powbot.jar"
  install -Dm755 powbot "${pkgdir}/usr/bin/powbot"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
