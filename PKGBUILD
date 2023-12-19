# Maintainer: Aloxaf <aloxafx@gmail.com>
# Contributor: Alex Hirzel <alex@hirzel.us>

pkgname=python-playwright
_name=playwright-python
pkgver=1.40.0
pkgrel=1
pkgdesc="a Python library to automate Chromium, Firefox and WebKit browsers with a single API"
arch=(x86_64)
url=https://github.com/microsoft/playwright-python
license=(Apache)
makedepends=('python-auditwheel' 'python-pip' 'python-setuptools' 'python-wheel')
depends=('nodejs' 'python' 'python-greenlet' 'python-pyee' 'python-typing_extensions')
source=("git+https://github.com/microsoft/${_name}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${_name}"
	python -m build --wheel
}

package() {
	cd "${_name}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
