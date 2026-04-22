# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-apify-fingerprint-datapoints
_name=apify_fingerprint_datapoints
pkgver=0.12.0
pkgrel=1
pkgdesc="Fingerprint datapoints files collected by Apify and originally stored at https://github.com/apify/fingerprint-suite."
arch=(any)
url="https://pypi.org/project/apify-fingerprint-datapoints/"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a748d6cf2cee853f0276421e661d398cf725e7f453a1a8228e11a3b28db1d825')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
