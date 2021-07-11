# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=jellex
pkgver=0.3.0
pkgrel=1
pkgdesc="TUI to filter JSON data with Python syntax"
arch=('any')
url="https://github.com/kellyjonbrazil/jellex"
license=('MIT')
depends=('jello' 'python-pygments' 'python-prompt_toolkit')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('786548df86cd2d896dace7c2640dc6e0938b5a1a8dd3d2760c2f9f598cd00951')

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
