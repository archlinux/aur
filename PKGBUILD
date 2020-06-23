# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=python-telegram
pkgver=0.12.0
pkgrel=1
pkgdesc="Python API for the tdlib library. It helps you build your own Telegram clients."
arch=(any)
url="https://github.com/alexander-akhmetov/python-telegram"
license=('MIT')
depends=('python3')
makedepends=()
source=("https://github.com/alexander-akhmetov/$pkgname/archive/$pkgver.tar.gz")
md5sums=('ebf3e34648e21da96e6470474e0fd7eb')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE $pkgdir/usr/share/license/$pkgname/LICENSE
}
