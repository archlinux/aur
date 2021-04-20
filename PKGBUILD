# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=langcodes
pkgname=python-langcodes
pkgver=3.1.0
pkgrel=1
pkgdesc="A toolkit for working with and comparing the standardized codes for languages"
arch=('any')
url="https://github.com/LuminosoInsight/langcodes"
license=('Apache')
makedepends=('python'
	'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/LuminosoInsight/langcodes/master/LICENSE.txt")
sha256sums=('1ccd37e3a68760d29ec3b17f5962cd1d8f242f4d9705ad1601c5cb7fab48199c'
            '84b11b945d88ab72e3790c5c2a0f8d0480f77d803bd810b5b149023bfce265af')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
