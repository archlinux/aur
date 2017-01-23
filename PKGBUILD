# Maintainer: Fabio Zanini <fabio.zanini _at_ stanford.edu>
pkgname='python2-pysam'
pkgver=0.10.0
pkgrel=1
pkgdesc="Python interface for the SAM/BAM sequence alignment and mapping format"
arch=('x86_64')
url="https://github.com/pysam-developers/pysam"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools' 'cython2>=0.22')
provides=('python2-pysam')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/pysam-developers/pysam/archive/v${pkgver}.tar.gz")
md5sums=('a117c060eed6ab5b5281c4d6aa502925')

package() {
  cd "$srcdir/pysam-$pkgver"
  # Use following line instead to compile with the internal htslib
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Use the following line to compile against external htslib from AUR (buggy)
  #HTSLIB_LIBRARY_DIR=/usr/lib HTSLIB_INCLUDE_DIR=/usr/include python2 setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
