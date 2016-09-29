# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=noteshrink-git
_pkgname=noteshrink
pkgver=0.1.r13.gfd645e9
pkgrel=1
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-pillow' 'imagemagick')
conflicts=('noteshrink')
source=('git+http://github.com/mzucker/noteshrink.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
