# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributer: Holly Becker <becker.holly@gmail.com>
pkgname=fido
pkgver=1.6.1
pkgrel=1
pkgdesc="A command-line tool to identify the file formats of digital objects."
arch=('any')
url="https://openpreservation.org/tools/fido/"
license=('Apache-2.0')
depends=('python'
         'python-olefile'
         'python-six'
         'python-importlib_resources'
         'python-requests')
makedepends=('python-build'
             'python-installer'
             'python-pytest-runner'
             'python-setuptools'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openpreserve/fido/archive/v$pkgver.tar.gz")
sha256sums=('6980d23cd7b5004b42334d3032adcbeafd99cf597edc758cad0cb23f2dbab18d')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
