# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-bna
pkgver=3.2
pkgrel=3
pkgdesc="Command-line Battle.net authenticator and Python library"
arch=("any")
license=("MIT")
url="https://github.com/jleclanche/python-bna"
depends=("python")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("5bd90a9bcfc3f4aa766e20460456afcd4a8a8760a0f0f264c480ffcc38ed5c03")


build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
