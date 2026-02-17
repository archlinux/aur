# Maintainer: Antonio Rodriguez <kontakt@antoniorodriguez.no>

pkgname=lexy
pkgver=0.5.2
pkgrel=1
pkgdesc="A CLI tool to fetch tutorials from Learn X in Y Minutes"
arch=('x86_64')
url="https://github.com/antoniorodr/lexy"
license=('MIT')
depends=('bat' 'python>=3.13' 'python-beautifulsoup4' 'python-click' 'python-requests' 'python-typer')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('5d8f8c64f58ee01aa944effcad89106ab9f6c61351a7ff9346ad31f427b14519')

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
