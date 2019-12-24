# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=rebound
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line tool that instantly fetches Stack Overflow results when an exception is thrown"
arch=('any')
url="https://github.com/shobrook/rebound"
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests' 'python-urwid')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d5cd356c17416dcdb90b34c09e793cb24550fbf00ac32a8ff85d58a312173f6')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	pytest
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
