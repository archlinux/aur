# Maintainer:  Giovanni Ciatto <giovanni.ciatto at gmail dot com>

pkgname=2p-kt
pkgver=0.20.3
pkgrel=1
pkgdesc='A Kotlin Multi-Platform ecosystem for symbolic AI'
arch=('any')
url='https://github.com/tuProlog/2p-kt'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('gendesk')
source=("2p-repl-${pkgver}.jar::${url}/releases/download/${pkgver}/2p-repl-${pkgver}-redist.jar")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('30d87129f2160b7f12c083bdf5797220a3cfa4d962b39e8dabfaa7db2a550e0b')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/${pkgname}/2p-repl.jar' \"\$@\"" > "2p"
  install -Dm755 2p-repl-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/2p-repl.jar"
  install -Dm755 2p "${pkgdir}/usr/bin/2p"
}
