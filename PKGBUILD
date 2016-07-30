# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-guiqwt
pkgver=3.0.2
pkgrel=1
pkgdesc="Python library providing efficient 2D data-plotting features"
arch=('i686' 'x86_64')
url="https://github.com/pierreraybaut/guiqwt"
license=('custom:CeCIL')
depends=('python2-guidata' 'python2-pythonqwt' 'python2-scipy' 'python2-pillow')
optdepends=('python2-pydicom: for DICOM files I/O features'
            'spyder: for Sift embedded Python console')
makedepends=('python2-setuptools' 'cython2')
options=(!emptydirs)

source=("https://github.com/PierreRaybaut/guiqwt/archive/v${pkgver}.tar.gz")
md5sums=('f56ed23bca92a4c489a7ab44be95f0ec')

build() {
  cd "$srcdir"/guiqwt-$pkgver

  unset LDFLAGS
  python2 setup.py build
}

package() {
  cd "$srcdir"/guiqwt-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/python2-guiqwt/LICENSE"
}

