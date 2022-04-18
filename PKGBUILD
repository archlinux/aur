# Maintainer:  Giovanni Ciatto <giovanni.ciatto at gmail dot com>

pkgname=2p-kt
pkgver=0.20.4
pkgrel=1
pkgdesc='A Kotlin Multi-Platform ecosystem for symbolic AI'
arch=('any')
url='https://github.com/tuProlog/2p-kt'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('gendesk')
source=("2p-repl-${pkgver}.jar::${url}/releases/download/${pkgver}/2p-repl-${pkgver}-redist.jar")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('1a85e8b2c5fdc96517ed2036c8625c6169ab44b397ca3615bcb21c0ccfce2602')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/${pkgname}/2p-repl.jar' \"\$@\"" > "2p"
  install -Dm755 2p-repl-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/2p-repl.jar"
  install -Dm755 2p "${pkgdir}/usr/bin/2p"
}
