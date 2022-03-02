# Maintainer: DanielNak <daniel@tee.cat>
# Python package author: Nicolas Schodet

_pkgname=nxt-python
# _author=DanManN
_author=schodet
pkgname=python-nxt
pkgver=3.0.0
pkgrel=3
pkgdesc="A python driver/interface for the Lego Mindstorms NXT robot based on NXT_python."
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('GPL3')
optdepends=('python-pyusb' 'python-pybluez')
depends=('python')
makedepends=('python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
source=($_pkgname-$pkgver.zip::"https://github.com/$_author/$_pkgname/archive/refs/tags/$pkgver.zip")
sha256sums=('69e0f9058f8c970278e3660795817b6f46ecc26248b2b9449a890f5093d2c1aa')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
