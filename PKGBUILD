# Maintainer: BrainDamage
pkgname=repren
pkgver=0.3.8
pkgrel=1
pkgdesc="Multi-pattern string replacement and file renaming, a command-line search-and-replace swiss army knife"
arch=(any)
url="https://github.com/jlevy/repren"
license=("custom:Apache")
depends=("python")
sha1sums=("26ad61be594cc112d6e26e62e939ab3f1db52e38")
source=("https://github.com/jlevy/repren/archive/$pkgver.tar.gz")

build() {
	cd "$srcdir/repren-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/repren-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
	install -m644 -D README.md "$pkgdir/usr/share/doc/repren/README"
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/repren/LICENSE"
}