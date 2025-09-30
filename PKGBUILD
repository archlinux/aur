# Maintainer: Doug Davis <ddavis at ddavis dot io>

_pkgname=pygram11
pkgname=python-pygram11
pkgver=0.13.3
pkgrel=1
pkgdesc="histogramming in python accelerated with OpenMP"
arch=("x86_64")
url="https://github.com/douglasdavis/pygram11"
license=("MIT")
depends=("python>=3.11" "python-numpy")
makedepends=(
    "gcc"
    "python-build"
    "python-installer"
    "python-wheel"
    "python-scikit-build-core"
    "cmake"
)
source=("https://files.pythonhosted.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("09d24ad001e03774f60d0084649a8306b112fb1891cc2d828570fa00777273d8")

build() {
  cd "${_pkgname}-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
