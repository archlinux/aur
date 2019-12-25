# Maintainer: Joe Dillon <josephd31415 at gmail dot com>
pkgname=taps
pkgver=1.0.1
pkgrel=1
pkgdesc="True Arch package security - audit your system and query packages"
arch=("any")
url="https://github.com/Vimru/taps"
license=("GPL3")
depends=("python" "python-colorful" "python-requests" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('87d616713a6d85de04becea657954ab13a455d317002cc72b947627ba063c599')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

