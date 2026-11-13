# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-camoufox
_name=camoufox
pkgver=0.5.9
pkgrel=1
pkgdesc="Wraps around Playwright's API to help automatically generate & inject unique device characteristics (OS, CPU info, navigator, fonts, headers, screen dimensions, viewport size, WebGL, addons, etc.) into Camoufox."
arch=(any)
url="https://pypi.org/project/camoufox/"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8d71f1c8d36323ee0d2ea1fd4c6de3ee4a7cdf95bf296b90b96d9096dc2f802c')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
