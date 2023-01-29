_name=satellite
pkgname=satellite-gtk
pkgver=0.3.1
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$_name"
license=('GPL3')
depends=(python-gobject libhandy python-pydbus python-pynmea2 python-gpxpy)
makedepends=(python-build python-installer python-wheel)
optdepends=(modemmanager gnss-share)
source=("https://codeberg.org/tpikonen/$_name/archive/$pkgver.tar.gz")
sha512sums=('db6454c49aeb2932799772fa50c26ca1db7f11e77e612636e19045cb41df7a00b9d9e3a08a1bbd35fa41408ddda9a03dd721e3132fcfe799479b9632895335f1')


build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
