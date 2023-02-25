pkgname=geobug
pkgver=0.1.4
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$pkgname"
license=('GPL3')
depends=(python-gobject libhandy python-pydbus python-gpxpy geoclue)
makedepends=(python-build python-installer python-wheel)
source=("https://codeberg.org/tpikonen/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('682430ca75c7953e3220b3a9c17b92f13816f8d43bdb1d2910b73947e4282d2bb56d693096d4c51ce045ac563cb7dd12a8c4f62f681bdc3494516cc1c669f009')


build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
