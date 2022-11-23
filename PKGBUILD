# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-uninstaller
pkgver=0.0.2
pkgrel=2
pkgdesc="A library for uninstalling python packages."
arch=('any')
url="https://github.com/greyltc-org/uninstaller"
license=('MIT')
depends=(
python
)
makedepends=(
python-build
python-hatchling
python-hatch-vcs
python-installer
python-wheel
git
)
validpgpkeys=('D903108568FB528B94BACE0A80DA60E72570377C')
_commit=1767f4ac5adca9c99620957772797965eaa05603  # tag v0.0.2
source=(git+https://github.com/greyltc-org/uninstaller?signed#commit=${_commit})
md5sums=('SKIP')

pkgver() {
  cd uninstaller
  hatchling version | sed 's,\.dev,dev,'
}

build() {
  cd uninstaller
  python -m build --wheel --no-isolation
}

package() {
  cd uninstaller
  python -m installer --destdir="$pkgdir" dist/*.whl
}
