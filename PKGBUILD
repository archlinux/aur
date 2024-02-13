# Maintainer: malacology <guoyizhang at malacology dot net>
_pkgname=HybPiper
pkgname=${_pkgname,,}
pkgver=2.1.6
pkgrel=0
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
sha256sums=('f6a8ef366d924508c953a4cedc660442694dfa41ec2180da32799be5094fe51f')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
