pkgname=mplcairo
pkgver=0.5
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
python-pip
python-setuptools
git
)
source=(git+https://github.com/matplotlib/mplcairo.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare(){
  cd mplcairo
}

build() {
  cd mplcairo
  python setup.py build
}

package() {
  cd mplcairo
  python setup.py install --root="$pkgdir" --optimize=1
}
