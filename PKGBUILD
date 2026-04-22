# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-twocaptcha
_name=TwoCaptcha
pkgver=0.0.1
pkgrel=1
pkgdesc="Python wrapper for 2Captcha API."
arch=(any)
url="https://pypi.org/project/twocaptcha/"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fd04127de71ca4bd31c22add84a5bcb7c683cf9ee5bf503ca14a8f372ac76a0e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
