# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=re7zip
pkgver=1.4
pkgrel=1
pkgdesc="7zip version capable of downloading files from archives on HTTP servers"
arch=('any')
url='http://reboot.pro/topic/17283-re7zip'
license=('LGPL')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.jar::https://github.com/ghuls/re7zip/releases/download/v${pkgver}/re7zip.jar")
sha256sums=('ca926dbbf491cef2bc828484f2348518896aa18c775f8edbcf51302e71ad5fba')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > re7zip.sh
  install -Dm755 re7zip.sh "${pkgdir}/usr/bin/re7zip"
}