# Maintainer: Ethan Brittain-Morby <ethan AT etha DOT nz>
pkgname=python-metaname-git
pkgver=r14.ce20e21
pkgrel=1
pkgdesc="A python JSON-RPC client for the Metaname API"
arch=('any')
url="https://github.com/metaname/python-metaname"
license=('MIT')
depends=(python python-requests)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/metaname/python-metaname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

