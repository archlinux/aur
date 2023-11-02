pkgname=geobug
pkgver=0.1.6
pkgrel=1
pkgdesc="Geobug is an adaptive client for GeoClue. It can display your location information and save a track of your movements to a GPX-file."
arch=('any')
url="https://codeberg.org/tpikonen/$pkgname"
license=('GPL3')
depends=(gtk3 python-gobject libhandy python-pydbus python-gpxpy geoclue)
makedepends=(python-build python-installer python-wheel)
source=("https://codeberg.org/tpikonen/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('18c8b124c7d6a42af353ad62fca0552348751136515486bef01fedf03bd87597b36ddf3a492adfbb02e897c7aaf6f47d5ac3b4682bff3b814421e1571d9a107a')


build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
