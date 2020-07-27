# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jacksum
pkgver=1.7.0
pkgrel=1
pkgdesc="A free and platform independent software for computing and verifying checksums, CRCs and message digests"
arch=('any')
url='https://jacksum.loefflmann.net'
license=('GPL2')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.zip::https://sourceforge.net/projects/jacksum/files/jacksum/jacksum-${pkgver}.zip/download")
sha256sums=('c6e2136b7adfc0ee78c273fdd0ddf7e2fc5741a5bdf46ff3c01aeff2bee519cf')

package() {
  install -Dm644 jacksum.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > jacksum.sh
  install -Dm755 jacksum.sh "${pkgdir}/usr/bin/jacksum"
}