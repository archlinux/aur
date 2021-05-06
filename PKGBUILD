# Maintainer: workonfire <kolucki62@gmail.com>

pkgname=babi
pkgver=0.0.21
pkgrel=1
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi' 'babi-grammars' 'python-identify')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('3e9721bc9a5c89c6e4c2812649eec995')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

