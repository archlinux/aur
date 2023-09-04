# Maintainer: Lev Levitsky <levlev at mail.ru>

pkgname=python-pynumpress
_bname=pynumpress
pkgver=0.0.8
pkgrel=1
pkgdesc="A more pythonic wrapper around the MSNumpress library for mass spectrometry numerical data compression"
arch=('x86_64')
url="https://github.com/mobiusklein/pynumpress"
license=('Apache')
depends=(python-numpy)
makedepends=(python-build python-installer python-wheel cython python-oldest-supported-numpy)
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/${_bname}/${_bname}-${pkgver}.tar.gz")
sha256sums=('8c449687d6924a71ee3d20331ea1a6e9f223ee82682a3b6f6eba5da26c46d591')

build() {
  cd "$srcdir/${_bname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_bname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
