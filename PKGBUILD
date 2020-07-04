# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=closh
pkgver=0.5.0
pkgrel=1
pkgdesc="Bash-like shell based on Clojure"
arch=('any')
url='https://github.com/dundalek/closh'
license=('EPL')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.jar::https://github.com/dundalek/closh/releases/download/v${pkgver}/closh-zero.jar")
sha256sums=('a7038d296a6ba8cd0063f6c47fd93962a4865d3c0e496d0f5c7af71fb1db3f1d')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > closh.sh
  install -Dm755 closh.sh "${pkgdir}/usr/bin/closh"
}