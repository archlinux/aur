# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=polib
pkgname=python-$_pkgname
pkgver=1.0.6
pkgrel=1
pkgdesc="A library to manipulate, create and modify gettext files"
url="https://bitbucket.org/izi/polib/"
arch=("any")
license=("MIT")
depends=("python")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=("2369620208823811a89a2da73ed606c9")
sha256sums=("20d2a0d589a692c11df549bd7cda83c665eef2a83e017b843fecdf956edbad74")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
