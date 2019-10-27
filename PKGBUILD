# Maintainer: Felix Bühler <account at buehler dot de>

pkgname=nautilus-open-any-terminal
pkgver=0.2.1
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(git python-setuptools)
_commit=bd2397028266ceb0e2653a35f9886e42796d0866
source=("git+https://github.com/Stunkymonkey/nautilus-open-any-terminal#commit=$_commit")
sha512sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  python3 setup.py build
}

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}

