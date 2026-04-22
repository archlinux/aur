# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-camoufox
_name=camoufox
pkgver=0.4.11
pkgrel=1
pkgdesc="Wraps around Playwright's API to help automatically generate & inject unique device characteristics (OS, CPU info, navigator, fonts, headers, screen dimensions, viewport size, WebGL, addons, etc.) into Camoufox."
arch=(any)
url="https://pypi.org/project/camoufox/"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0a2c9d24ac5070c104e7c2b125c0a3937f70efa416084ef88afe94c32a72eebe')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
