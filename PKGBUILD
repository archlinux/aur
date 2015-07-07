# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-guiqwt
pkgver=2.3.1
pkgrel=1
pkgdesc="Python library providing efficient 2D data-plotting features"
arch=('i686' 'x86_64')
url="http://code.google.com/p/guiqwt/"
license=('custom:CeCIL')
depends=('python2-guidata' 'pyqwt' 'python2-scipy' 'python-imaging')
optdepends=('python2-pydicom: for DICOM files I/O features'
            'spyder: for Sift embedded Python console')
makedepends=('python2-distribute' 'unzip' 'cython2')
options=(!emptydirs)

source=(http://guiqwt.googlecode.com/files/guiqwt-$pkgver.zip)
md5sums=('4dbbfa7ca62f5d9222e7c84f8a8995c2')

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

