# Maintainer: malacology <guoyizhang at malacology dot net>
_pkgname=HybPiper
pkgname=${_pkgname,,}
pkgver=2.3.0
pkgrel=1
url="https://github.com/mossmatters/$_pkgname"
pkgdesc="Recovering genes from targeted sequence capture data \
	 https://doi.org/10.3732/apps.1600016"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('python'
	'python-seaborn' 'python-pebble' 'python-matplotlib' 'python-progressbar' 'python-scipy' 'python-scipy' 'python-pandas' 'python-biopython' 'python-psutil'
       	'diamond' 'exonerate' 'blast+' 'diamond' 'bwa' 'bbmap' 'spades' 'parallel' 'samtools' 'mafft')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b9d0af243dbdd24cb299cf8e05e65dafa873afc2c7605e3fae74b455457b491')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
