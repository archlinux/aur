# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-playwright-captcha
_name=playwright_captcha
pkgver=0.1.4
pkgrel=1
pkgdesc="Helps solve captchas in Playwright or Playwright-based frameworks (like Camoufox or Patchright) automatically."
arch=(any)
url="https://pypi.org/project/playwright-captcha/"
license=(Apache-2.0)
depends=(python python-playwright)
makedepends=(python-build python-installer python-wheel)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('78140c9f8a6710d7b4334bed4ad481f72f0aae18709a914d47dcea5576c6c412')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
