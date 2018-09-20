# Maintainer: Fabio Zanini <fabio.zanini _at_ stanford.edu>
pkgname='python-pysam'
pkgver=0.15.0
pkgrel=2
pkgdesc="Python interface for the SAM/BAM sequence alignment and mapping format"
arch=('x86_64')
url="https://github.com/pysam-developers/pysam"
license=('MIT')
groups=()
depends=('python')
makedepends=('python-setuptools' 'cython>=0.22')
provides=('python-pysam')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/pysam-developers/pysam/archive/v${pkgver}.tar.gz")
md5sums=('80b6cd208a601b06b3778d4af33ddb89')

package() {
  cd "$srcdir/pysam-$pkgver"
  # Use following line instead to compile with the internal htslib
  python setup.py install --root="$pkgdir/" --optimize=1
  # Use the following line to compile against external htslib from AUR (buggy)
  #HTSLIB_LIBRARY_DIR=/usr/lib HTSLIB_INCLUDE_DIR=/usr/include python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
