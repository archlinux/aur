# Maintainer: Felix Bühler <account at buehler dot de>

pkgname=nautilus-open-any-terminal
pkgver=0.2.7
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(git python-setuptools)
_commit=df37ad5ee0040c601dccebbf1ba2f4c82fbe3853
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

