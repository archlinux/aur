
pkgname=python2-pythran-git
pkgver=r1886.09e36dbb
pkgrel=1
pkgdesc="A claimless python to c++ converter"
arch=('i686' 'x86_64')
url="http://pythonhosted.org/pythran/"
license=('BSD')
depends=('python2-networkx' 'python2-ply' 'python2-colorlog' 'python2-numpy' 'python2-gast' 'python2-six' 'gperftools' 'gmp' 'boost')
makedepends=('python2-setuptools' 'git' 'cmake')
provides=('python2-pythran')
conflicts=('python2-pythran')
source=("git+https://github.com/serge-sans-paille/pythran.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/pythran
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/pythran
  python2 setup.py build
}

package() {
  cd "$srcdir"/pythran
  python2 setup.py install --root=$pkgdir --optimize=1
}
