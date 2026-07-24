pkgname=python-meteostat
pkgver=2.1.4
pkgrel=1
pkgdesc="Access and analyze historical weather and climate data with Python"
url="https://github.com/meteostat/meteostat"
arch=('any')
license=('MIT')
depends=("python" "python-numpy" "python-pandas" "python-pytz" "python-requests" "python-lxml")
optdepends=("python-metar: access METAR and SPECI weather reports from NOAA"
    "python-matplotlib: enable plotting")
source=("$pkgname-$pkgver.tar.gz::https://github.com/meteostat/meteostat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('43d714f842a0a4031bd6718b46c70615f34a3b4d7163bd8d8fbaf7448bc839a6')

build() {
    cd "$srcdir/meteostat-$pkgver"
    python -m build --wheel --no-isolation
}
 
package() {
    cd "$srcdir/meteostat-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
