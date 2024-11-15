_name=satellite
pkgname=satellite-gtk
pkgver=0.5.0
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$_name"
license=('GPL3')
depends=(python-gobject gtk3 libhandy python-pydbus python-pynmea2 python-gpxpy)
makedepends=(python-build python-installer python-wheel)
optdepends=(modemmanager gnss-share)
source=("https://codeberg.org/tpikonen/$_name/archive/$pkgver.tar.gz")
sha512sums=('a925e4749952e5278f2ca7eb0b93616852b28cc6ef0254ec245ddf430586968d73fda5db44f6fef7977c8f5861d859de06e30eb4d54b166d6d13e863bc0e2328')


build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
