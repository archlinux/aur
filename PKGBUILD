# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-playwright-captcha
_name=playwright_captcha
pkgver=0.1.5
pkgrel=1
pkgdesc="Helps solve captchas in Playwright or Playwright-based frameworks (like Camoufox or Patchright) automatically."
arch=(any)
url="https://pypi.org/project/playwright-captcha/"
license=(Apache-2.0)
depends=(python python-playwright)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ac2b772f9a3fc0381bfb2702981a9403e4d04368fba40d748f55b0a0a115b9cd')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
