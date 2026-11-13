# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-apify-fingerprint-datapoints
_name=apify_fingerprint_datapoints
pkgver=0.16.0
pkgrel=1
pkgdesc="Fingerprint datapoints files collected by Apify and originally stored at https://github.com/apify/fingerprint-suite."
arch=(any)
url="https://pypi.org/project/apify-fingerprint-datapoints/"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0d187bf8d24566a517f915ad8e168208e4ab47fea5e900b08e9d0e7e9ba71da8')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
