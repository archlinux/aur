# Contributor: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python2-imread"
pkgver=0.7.4
pkgrel=1
pkgdesc="Read images to numpy arrays"
arch=('x86_64')
url="https://pypi.python.org/pypi/imread/"
license=('MIT')
depends=('python2' 'libpng' 'libtiff' 'libwebp' 'python2-numpy') 
makedepends=('python2-setuptools')
provides=('python2-imread')
source=("https://pypi.python.org/packages/source/i/imread/imread-$pkgver.tar.gz")
sha256sums=('0487adef11a22168700968c1727020361a72f6132b6ced2b8826b02d8cbf744f')

build() {
  cd "$srcdir/imread-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/imread-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}