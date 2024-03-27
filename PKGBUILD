_name=satellite
pkgname=satellite-gtk
pkgver=0.4.3
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$_name"
license=('GPL3')
depends=(python-gobject gtk3 libhandy python-pydbus python-pynmea2 python-gpxpy)
makedepends=(python-build python-installer python-wheel)
optdepends=(modemmanager gnss-share)
source=("https://codeberg.org/tpikonen/$_name/archive/$pkgver.tar.gz")
sha512sums=('a1e184253b7a1e9d3e0625a021daed03ce2fe76ef46c9445ff037ca0915127228921b71ccdcee493f1f7dee59c0462e9aeeda4fc0f8e6cccb28f7c6364b0848f')


build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
