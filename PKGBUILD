# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=jellex
pkgver=0.5.2
pkgrel=1
pkgdesc="TUI to filter JSON data with Python syntax"
arch=('any')
url="https://github.com/kellyjonbrazil/jellex"
license=('MIT')
depends=('jello' 'python-pygments' 'python-prompt_toolkit')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2a04db483d67f58bca49b54c7ecd6035910c59177e789d89df0efbb5df17a98')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
