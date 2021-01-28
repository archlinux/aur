# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Elvin Luff <elvin@eelviny.me>

_pkgname=nxt-python
# _author=DanManN
_author=Eelviny
_pkgver=96bbf2505e96d475df5e9bca01b556887aa8a610
pkgname=python-nxt
pkgver=3.0
pkgrel=2
pkgdesc="A python driver/interface for the Lego Mindstorms NXT robot based on NXT_python."
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('GPL3')
optdepends=('python-pyusb' 'python-pybluez')
depends=('python')
makedepends=('python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=($_pkgname-$pkgver.zip::"https://github.com/$_author/$_pkgname/archive/$_pkgver.zip")
sha256sums=('f391242ae2f4e7907c56f7d8c25b380a9b3cbec0cbf92061972cf2003ddb3226')

build() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$_pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
