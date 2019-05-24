# Maintainer: Felix Bühler <account at buehler dot de>

pkgname=nautilus-open-any-terminal
pkgver=0.1.0
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python2-nautilus)
makedepends=(git python-setuptools)
_commit=af11ce88bc246cd65bd0c3d24ffbdb78dc1dec6f
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

