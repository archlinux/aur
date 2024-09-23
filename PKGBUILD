pkgname=geobug
pkgver=0.1.7
pkgrel=1
pkgdesc="Geobug is an adaptive client for GeoClue. It can display your location information and save a track of your movements to a GPX-file."
arch=('any')
url="https://codeberg.org/tpikonen/$pkgname"
license=('GPL3')
depends=(gtk3 python-gobject libhandy python-pydbus python-gpxpy geoclue)
makedepends=(python-build python-installer python-wheel)
source=("https://codeberg.org/tpikonen/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9d742427804e4fed62c226304e9d045d0ac5c8108b19d76a9b3f728be96b44d7a4778bc7fff400bbbd3a5fb795453c57d279a54b2d901a74b64e8a15e5bf9828')


build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
