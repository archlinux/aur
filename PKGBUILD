# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pybedtools'
pkgver=0.7.10
pkgrel=1
pkgdesc="Python wrapper for Aaron Quinlan's bedtools."
arch=('any')
url="http://daler.github.io/pybedtools"
license=('GPL2')
depends=(
  'python'
  'python-numpy'
  'python-pandas'
  'python-pysam>=0.8.1'
  'python-six')
makedepends=('cython' 'python-setuptools')
optdepends=(
  'bedtools: more-or-less required by namesake'
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')
provides=('python-pybedtools')
conflicts=('python-pybedtools')
options=(!emptydirs)
source=("https://github.com/daler/${pkgname//python-/}/archive/v${pkgver}.tar.gz")
md5sums=('2791d8005a3ce286e597de5adc68a369')

package() {
  cd "${srcdir}/${pkgname//python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
