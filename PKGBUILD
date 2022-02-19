# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=ndjson-testrunner
pkgname=python-$_name
pkgver=1.0.0
pkgrel=2
pkgdesc='A python unittest test runner that outputs newline delimited JSON results'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c2b5486ff8198ae18995a0170b4161b55b42f1a991ee1f6de68fc27140bc3df3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
