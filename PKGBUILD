# Maintainer: workonfire <kolucki62@gmail.com>

_pkgname=onigurumacffi
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc="Python cffi bindings for the oniguruma regex engine"
arch=('x86_64')
url="https://github.com/asottile/onigurumacffi"
license=('MIT')
depends=('oniguruma' 'python-cffi')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('191a556c60f4d93a42127292b16e2f98')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

