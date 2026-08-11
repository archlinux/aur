# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-camoufox
_name=camoufox
pkgver=0.5.4
pkgrel=1
pkgdesc="Wraps around Playwright's API to help automatically generate & inject unique device characteristics (OS, CPU info, navigator, fonts, headers, screen dimensions, viewport size, WebGL, addons, etc.) into Camoufox."
arch=(any)
url="https://pypi.org/project/camoufox/"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a5213a4dd90398fa140cf010fd865129cc97b9cb4a7c2fc71c067f428ce49ddf')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
