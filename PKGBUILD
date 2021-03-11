# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-libcsearcher
_pkgname="LibcSearcher"
pkgver=1.1.5
pkgrel=1
pkgdesc="Python wrapper for libc-database."
arch=('any')
url="https://github.com/IZAY01/LibcSearcher"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('302246d0e5bcb0aa1c464f65ef349c85f82520120d45ca5a58d3445d45833f76')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
