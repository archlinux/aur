# Maintainer: malacology <guoyizhang at malacology dot net>
_pkgname=HybPiper
pkgname=${_pkgname,,}
pkgver=2.2.0
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
sha256sums=('8337b1d17de9fa11f9d2b3f59ccc4597c5e3359d70e26d88346e871ccc6b1ac3')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
