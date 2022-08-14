pkgname=python-micloud
_pkgbase=${pkgname#python-}
pkgver=0.5
pkgrel=1
arch=('any')
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/Squachen/micloud/archive/v_${pkgver}.tar.gz")
sha256sums=('47750d0102390e5f1e300d3bf1da048003f5ca7fbd91594a4c443136787b5ba4')

build() {
    cd "$_pkgbase-v_$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbase-v_$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
