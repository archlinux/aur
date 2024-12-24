pkgname=mplcairo
pkgver=0.6.1
pkgrel=1
pkgdesc="A (new) cairo backend for Matplotlib."
arch=(x86_64)
url=https://github.com/matplotlib/mplcairo
license=('MIT')
depends=(
python-matplotlib
python-cairo
cairo
)
makedepends=(
python-build
python-installer
python-wheel
python-setuptools-scm
pybind11
)

#source=(git+https://github.com/matplotlib/mplcairo.git#tag=v${pkgver})
#sha256sums=('87')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matplotlib/mplcairo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('250588abeacab57db9d580f11ce3149bb12a55a2076103cc9489b95a82eb5a59')

prepare(){
  cd mplcairo-${pkgver}
}

build() {
  cd mplcairo-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd mplcairo-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
