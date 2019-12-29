# Maintainer: Joe Dillon <josephd31415 at gmail dot com>
pkgname=taps
pkgver=1.0.1
pkgrel=2
pkgdesc="True Arch package security - audit your system and query packages"
arch=("any")
url="https://github.com/Vimru/taps"
license=("GPL3")
depends=("python" "python-colorful" "python-requests" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vimru/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ab7adbfbc44fbc00d060e476b1421f9db7a6ee7be6cd1e1df94dd59527c43c1d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

