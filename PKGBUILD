# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-mortgage_calculator-git
pkgver=0.0.2
pkgrel=1
pkgdesc="Helps with understanding and managing loans/mortgages"
arch=('x86_64')
url="https://github.com/greyltc/mortgage_calculator"
license=('MIT')
depends=(
python
python-humanfriendly
python-scipy
python-fpdf2
)
makedepends=(
python-build
python-hatchling
python-hatch-vcs
python-wheel
git
)
source=(git+https://github.com/greyltc/mortgage_calculator)
md5sums=('SKIP')

pkgver() {
  cd mortgage_calculator
  hatchling version | sed 's,\.dev,dev,'
}

build() {
  cd mortgage_calculator
  python -m build --wheel --no-isolation
}

package() {
  cd mortgage_calculator
  python -m installer --destdir="$pkgdir" dist/*.whl
}
