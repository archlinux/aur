# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-untwisted
pkgver=3.2.2
pkgrel=2
pkgdesc='Event-driven framework for networking applications'
arch=('any')
url="https://github.com/untwisted/untwisted"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ddee7f9d6c732eb210f3aeea4896ff34f795326a5b3401adb3814748d995f188')

build() {
	cd "untwisted-$pkgver"
	python setup.py build
}

check() {
	cd "untwisted-$pkgver"
	python tests.py
}

package() {
	cd "untwisted-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
