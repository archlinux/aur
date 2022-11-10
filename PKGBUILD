# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=genx
_name=${pkgname}3
pkgver=3.6.15
pkgrel=1
pkgdesc="X-ray and Neutron reflectivity fitting software"
arch=("x86_64")
url="https://github.com/aglavic/genx"
license=("GPL v3")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-h5py" "python-wxpython" "python-appdirs" "python-requests" "python-docutils" "python-numba" "python-orsopy")
makedepends=(python-build python-installer python-wheel)
source=(https://github.com/aglavic/genx/releases/download/v$pkgver/GenX-$pkgver.tar.gz)
sha256sums=("bda8e07cdd2e224bccc3ac7a302c7550562ad6b0e4e92930e6d402d9c31714e3")

build() {
  cd "$srcdir"/$_name-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
