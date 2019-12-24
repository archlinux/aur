# Maintainer: Joe Dillon <josephd31415 at gmail dot com>
pkgname=taps
pkgver=1.0.0
pkgrel=1
pkgdesc="True Arch package security - audit your system and query packages"
arch=("any")
url="https://github.com/Vimru/taps"
license=("GPL3")
depends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('056e4e95b885769c7328694d8fe42fc82b5f7f7c73dfc8b564c7a4b7ccafe8e5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

