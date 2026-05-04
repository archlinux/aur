# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-apify-fingerprint-datapoints
_name=apify_fingerprint_datapoints
pkgver=0.13.0
pkgrel=1
pkgdesc="Fingerprint datapoints files collected by Apify and originally stored at https://github.com/apify/fingerprint-suite."
arch=(any)
url="https://pypi.org/project/apify-fingerprint-datapoints/"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('263141c19e9bc90a821e6b4e2b845925f17e0b8fbd53a897fc71546bd50df7f1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
