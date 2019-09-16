# Maintainer: Connor Behan <connor.behan@gmail.com>

pkgname=python2-symengine-git
pkgver=r965.b53d68b
pkgrel=1
pkgdesc="Python bindings for symengine"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('symengine-git' 'python2')
makedepends=('cmake' 'git' 'cython2' 'python2-setuptools' 'flint')
source=(git+https://github.com/symengine/symengine.py.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/symengine.py"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/symengine.py"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
