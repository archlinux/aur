# Maintainer: Felix Bühler <account at buehler dot de>

pkgname=nautilus-open-any-terminal
pkgver=0.5.0
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(git python-setuptools)
_commit=733cefb5269c9910606eef3df46f4e02c7726d43
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
