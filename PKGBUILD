pkgname=python-meteostat
pkgver=2.1.3
pkgrel=1
pkgdesc="Access and analyze historical weather and climate data with Python"
url="https://github.com/meteostat/meteostat"
arch=('any')
license=('MIT')
depends=("python" "python-numpy" "python-pandas" "python-pytz" "python-requests" "python-lxml")
optdepends=("python-metar: access METAR and SPECI weather reports from NOAA"
    "python-matplotlib: enable plotting")
source=("$pkgname-$pkgver.tar.gz::https://github.com/meteostat/meteostat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('22dbab0bb1fba11abb0281f8ee94a84ee3568596f0a0e5b1ece6134cf54be0a8')

build() {
    cd "$srcdir/meteostat-$pkgver"
    python -m build --wheel --no-isolation
}
 
package() {
    cd "$srcdir/meteostat-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
