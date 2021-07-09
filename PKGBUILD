# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=jellex
pkgver=0.2.3
pkgrel=1
pkgdesc="TUI to filter JSON data with Python syntax"
arch=('any')
url="https://github.com/kellyjonbrazil/jellex"
license=('MIT')
depends=('jello' 'python-pygments' 'python-prompt_toolkit')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7eabde09f49b44118392e9ecec8dc74a93c5700a239e19937feafaa404c6ca98')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
