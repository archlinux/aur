# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=liquid
pkgver=2.0.3
pkgrel=1
pkgdesc="Clojure Text Editor, for editing clojure code and markdown. Written entirely in Clojure with inspiration from Emacs and Vim"
arch=('any')
url='https://github.com/mogenslund/liquid'
license=('EPL')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.jar::https://github.com/mogenslund/liquid/releases/download/v${pkgver}/liquid-${pkgver}-standalone.jar")
sha256sums=('4e491972752d3ff1593923e1754d3dc101e6c923201c031389abc7479faa0c78')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > liquid.sh
  install -Dm755 liquid.sh "${pkgdir}/usr/bin/liquid"
}