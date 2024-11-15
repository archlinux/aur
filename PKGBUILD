pkgname=geobug
pkgver=0.1.8
pkgrel=1
pkgdesc="Geobug is an adaptive client for GeoClue. It can display your location information and save a track of your movements to a GPX-file."
arch=('any')
url="https://codeberg.org/tpikonen/$pkgname"
license=('GPL3')
depends=(gtk3 python-gobject libhandy python-pydbus python-gpxpy geoclue)
makedepends=(python-build python-installer python-wheel)
source=("https://codeberg.org/tpikonen/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6199032a9809f1ffc63d5ef9c15cfb12e218c3f3ff2e842a443b94cf271cf87fac468c9deb1e7c871db688a5ceae9e555a3e821ff825267a9e058e8538ead23c')


build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
