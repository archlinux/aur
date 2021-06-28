# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=2p-kt
pkgver=0.18.0
pkgrel=1
pkgdesc='A Kotlin Multi-Platform ecosystem for symbolic AI'
arch=('any')
url='https://gitlab.com/pika-lab/tuprolog/2p-in-kotlin'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/tuProlog/2p-kt/releases/download/${pkgver}/2p-repl-${pkgver}-redist.jar")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('49d14c19fc6dd2cd4d05a97dd84fb6a13c2e3b3bfcdfc6377f024676d914d592')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/2p-kt/2p-kt.jar' \"\$@\"" > "2p-kt"
  install -Dm755 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/2p-kt/2p-kt.jar"
  install -Dm755 2p-kt "${pkgdir}/usr/bin/2p-kt"
}
