# Maintainer: Antonio Rodriguez <kontakt@antoniorodriguez.no>

pkgname=lexy
pkgver=0.5.3
pkgrel=1
pkgdesc="A CLI tool to fetch tutorials from Learn X in Y Minutes"
arch=('x86_64')
url="https://github.com/antoniorodr/lexy"
license=('MIT')
depends=('bat' 'python>=3.13' 'python-beautifulsoup4' 'python-click' 'python-requests' 'python-typer')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('f78888b0d519731848f9e6e8a919fec00525c0fa3a503192264fc09de445f4f7')

build() {
	cd $pkgname-$pkgver || exit
	msg2 "Building package..."
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver || exit
	msg2 "Installing package..."
	python -m installer --destdir="$pkgdir" dist/*.whl
}
