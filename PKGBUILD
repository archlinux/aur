# Maintainer: Joe Dillon <josephd31415 at gmail dot com>
pkgname=taps
pkgver=1.1.0
pkgrel=1
pkgdesc="True Arch package security - audit your system and query packages"
arch=("any")
url="https://github.com/Vimru/taps"
license=("GPL3")
depends=("python" "python-colorful" "python-requests" "python-setuptools" "pyalpm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vimru/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('46b519c3992df2007fb4b2cc606b1301141124090f3f273f55752a89070a20cb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

