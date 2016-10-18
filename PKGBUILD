# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>
# Contributor: Tristelune <tristelune [at] archlinux.info>

pkgname=noteshrink-git
_pkgname=noteshrink
pkgver=0.1.1.r0.g7d876e5
pkgrel=3
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python-numpy>=1.10' 'python-scipy' 'python-pillow' 'imagemagick')
makedepends=('python-setuptools')
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
