# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: Ng Oon-Ee <ngoonee@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-linuxtools
pkgver=5.0.0
pkgrel=1
pkgdesc="Eclipse Linux Tools Project"
url="http://www.eclipse.org/linuxtools"
arch=('any')
license=('EPL')
depends=('eclipse-cpp')
optdepends=(
	'eclipse-ptp: remote profiling'
	'eclipse-rse: LTTng and remote profiling'
	'eclipse-gef: Draw2d and Zest'
	'eclipse-tcf: legacy LTTng'
	'eclipse-antlr-runtime: Tracing/LTTng'
)
makedepends=('java-environment')
source=("http://www.eclipse.org/downloads/download.php?r=1&mirror_id=274&file=/linuxtools/linuxtools-${pkgver}.zip")
sha256sums=('65ebc216f6117ae477f9c22812203ce5767f3b79c7c585bee247a34669a62adc')

package() {
  d="$pkgdir/usr/lib/eclipse/dropins/linuxtools/eclipse"
  install -d "$d"
  cp -a features "$d"
  cp -a plugins "$d"
}
