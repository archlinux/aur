# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=2p-kt
pkgver=0.17.3
pkgrel=1
pkgdesc='A Kotlin Multi-Platform ecosystem for symbolic AI'
arch=('any')
url='https://gitlab.com/pika-lab/tuprolog/2p-in-kotlin'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/tuProlog/2p-kt/releases/download/${pkgver}/2p-repl-${pkgver}-redist.jar")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('2fe08e050582032a88788aa8bef8d4d7e294bee0d70b2c1a322364d60e189888')

package() {
  echo "#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/2p-kt/2p-kt.jar' \"\$@\"" > "2p-kt"
  install -Dm755 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/2p-kt/2p-kt.jar"
  install -Dm755 2p-kt "${pkgdir}/usr/bin/2p-kt"
}
