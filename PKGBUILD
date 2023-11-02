_name=satellite
pkgname=satellite-gtk
pkgver=0.4.2
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$_name"
license=('GPL3')
depends=(python-gobject gtk3 libhandy python-pydbus python-pynmea2 python-gpxpy)
makedepends=(python-build python-installer python-wheel)
optdepends=(modemmanager gnss-share)
source=("https://codeberg.org/tpikonen/$_name/archive/$pkgver.tar.gz")
sha512sums=('1bfceab587fc960834803849a9ddb1b2c9e4fd9ed60c81fe460179e1abd3367dca756d7e1586c2d6c0195bf95ae56e89f0f62f986718f899202eb4bc39e1ad80')


build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
