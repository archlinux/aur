# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=liquid
pkgver=2.0.5
pkgrel=1
pkgdesc="Clojure Text Editor, for editing clojure code and markdown. Written entirely in Clojure with inspiration from Emacs and Vim"
arch=('any')
url='https://github.com/mogenslund/liquid'
license=('EPL')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.jar::https://github.com/mogenslund/liquid/releases/download/v${pkgver}/liquid-${pkgver}-standalone.jar")
sha256sums=('e2123f1b7999a202139538e45ef4d61398e6b1c8d3239f1695661aff5f1e73f5')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > liquid.sh
  install -Dm755 liquid.sh "${pkgdir}/usr/bin/liquid"
}
