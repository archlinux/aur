# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-cymem
_origpkgname=cymem
pkgver=2.0.2
pkgrel=1
pkgdesc="Manage calls to calloc/free through Cython"
arch=("x86_64")
url="https://github.com/explosion/cymem"
license=("MIT")
depends=("python")
makedepends=("cython" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cymem/archive/v$pkgver.tar.gz")
md5sums=("bef801db34e23b970ea996d0ebd0300a")

package() {
	cd "$_origpkgname-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	
}
