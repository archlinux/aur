# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pybedtools'
pkgver=0.7.10
pkgrel=2
pkgdesc="Python wrapper for Aaron Quinlan's bedtools."
arch=('any')
url="http://daler.github.io/pybedtools"
license=('GPL2')
depends=(
  'bedtools'
  'python'
  'python-numpy'
  'python-pandas'
  'python-pysam'
  'python-six')
makedepends=('python' 'cython' 'python-setuptools')
optdepends=(
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')
options=(!emptydirs)
source=("https://pypi.python.org/packages/09/57/e7668e8644c60413be05b8cc9c23aaea3a0717b4025843d8c26b7c4822af/pybedtools-0.7.10.tar.gz")
sha256sums=('518a2311bd33f29cf2ee8fc1a028dda8c8e380c9fc83fcb0fbaa206933174b50')

package() {
  cd "${srcdir}/${pkgname//python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
