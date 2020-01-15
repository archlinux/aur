# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-cymem
_origpkgname=cymem
pkgver=2.0.3
pkgrel=1
pkgdesc="Manage calls to calloc/free through Cython"
arch=("x86_64")
url="https://github.com/explosion/cymem"
license=("MIT")
depends=("python")
makedepends=("cython" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cymem/archive/v$pkgver.tar.gz")
md5sums=('27dc49a054c11a279e9c9ff6cb942520')

package() {
	cd "$_origpkgname-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	
}
