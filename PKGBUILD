# Maintainer: codeZ <navintiwari08@gmail.com>

pkgname=python-neat-python-git
pkgver=0.92
pkgrel=1
pkgdesc="Python implementation of NEAT"
arch=(i686 x86_64)
url="https://neat-python.readthedocs.io/en/latest/"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-neat-python')
conflicts=('python-neat-python')
source=("$pkgname::git+https://github.com/CodeReclaimers/neat-python")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --prefix=/usr \
                          --root="$pkgdir/"
}
