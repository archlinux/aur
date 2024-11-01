pkgname=mplcairo
pkgver=0.6
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
python-setuptools
pybind11
)

#source=(git+https://github.com/matplotlib/mplcairo.git#tag=v${pkgver})
#sha256sums=('87')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matplotlib/mplcairo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27ef1755b2e4872b4966524b54c227ac24faa000273193c21318b8c123e49ce4')

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
