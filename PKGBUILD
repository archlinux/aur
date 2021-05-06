# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=babi-grammars
pkgver=0.0.24
pkgrel=1
pkgdesc="Grammars for babi text editor"
arch=('any')
url="https://github.com/asottile/babi-grammars"
license=('MIT')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('a1db1346669563b471627c2818f3c47e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

