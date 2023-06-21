_name=satellite
pkgname=satellite-gtk
pkgver=0.4.1
pkgrel=1
pkgdesc="Displays Global Navigation Satellite System (GNSS: GPS, Galileo, Glonass etc.) information obtained from NMEA sources and saves your tracks"
arch=('any')
url="https://codeberg.org/tpikonen/$_name"
license=('GPL3')
depends=(python-gobject gtk3 libhandy python-pydbus python-pynmea2 python-gpxpy)
makedepends=(python-build python-installer python-wheel)
optdepends=(modemmanager gnss-share)
source=("https://codeberg.org/tpikonen/$_name/archive/$pkgver.tar.gz")
sha512sums=('639ff8c116bc11f247006262890bb62b2234427edd4750cff5402d85eef9b66d6e10d48b78943ba167fdd98d5db49d9a1fe7f8588f6517fec56d8af4e6ce2206')


build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
