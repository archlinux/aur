# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=darkdetect
pkgname=python-${_name}
pkgver=0.5.1
pkgrel=1
pkgdesc="Detect OS Dark Mode from Python"
arch=('any')
url="https://github.com/albertosottile/${_name}"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2bf5b7a8c6e362d153d60e5cd6df00537c16fb0f9551566ffe56c7b08e345ab8')

build() {
	cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
