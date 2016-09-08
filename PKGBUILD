pkgname=python-parmed-git
pkgver=r2450.808e5f4
pkgrel=1
pkgdesc="Parameter/topology editor and molecular simulator"
arch=('i686' 'x86_64')
url="https://parmed.github.io/ParmEd/html/index.html"
depends=('python')
conflicts=('python-parmed')
license=('MIT' 'LGPL')
source=('git://github.com/ParmEd/ParmEd.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ParmEd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/ParmEd
  python setup.py install --root=${pkgdir} || 1
}
