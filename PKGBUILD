pkgname=python-primefac-git
pkgver=r17.377e766
pkgrel=1
pkgdesc="Module and command-line utility for factoring integers into primes. Formerly called pyfac."
url="https://github.com/elliptic-shiho/primefac-fork"
arch=('any')
license=('MIT')
provides=('python-primefac')
confilcts=('python-primefac')
depends=('python')
makedepends=('python-setuptools')
source=("git+https://github.com/elliptic-shiho/primefac-fork.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/primefac-fork"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/primefac-fork"
  python setup.py build
} 

package() {
  cd "${srcdir}/primefac-fork"
  python setup.py install --root=${pkgdir} --optimize=1
}
