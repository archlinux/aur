# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Elvin Luff <elvin@eelviny.me>

_pkgname=nxt-python
_author=Eelviny
_pkgver=d532427e90b526ecfd73efe2d566ec69f0c4728a
pkgname=python-nxt
pkgver=3.0
pkgrel=1
pkgdesc="A python driver/interface for the Lego Mindstorms NXT robot based on NXT_python."
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/$_author/$_pkgname/archive/$_pkgver.zip")
sha256sums=('78028f567b8722502d8c97dda479a866b5a3e2f9a9563a02863532ba5ca4660b')

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
