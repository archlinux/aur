# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-ailment
_pkgname="${pkgname#*-}"
pkgver=9.0.10730
pkgrel=1
pkgdesc="The angr intermediate language."
arch=('any')
url="https://github.com/angr/ailment"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4fab184783736e7090a6dde80ac655f39b812c41d38d212325abbfd56d585c85')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
