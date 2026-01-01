pkgname=python-meteostat
pkgver=2.0.0
pkgrel=1
pkgdesc="Access and analyze historical weather and climate data with Python"
url="https://github.com/meteostat/meteostat"
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meteostat/meteostat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36352ed451605d2909092b5b4199f8c22bb98dff43b3f1a358fd7d2464bb02b7')

build() {
    cd "$srcdir/meteostat-$pkgver"
    python -m build --wheel --no-isolation
}
 
package() {
    cd "$srcdir/meteostat-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
