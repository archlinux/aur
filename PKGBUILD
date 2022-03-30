# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-ailment
_pkgname="${pkgname#*-}"
pkgver=9.1.12332
pkgrel=1
pkgdesc="The angr intermediate language."
arch=('any')
url="https://github.com/angr/ailment"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1fa9ba9548f7eec016a48fee98461e42241637453d2b47451517310f6bb438cd')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
