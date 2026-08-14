# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-apify-fingerprint-datapoints
_name=apify_fingerprint_datapoints
pkgver=0.15.0
pkgrel=1
pkgdesc="Fingerprint datapoints files collected by Apify and originally stored at https://github.com/apify/fingerprint-suite."
arch=(any)
url="https://pypi.org/project/apify-fingerprint-datapoints/"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5776fe73feaa3910265cae55599552b098f3a716d8872c9a0c2295ff2bb680dc')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
