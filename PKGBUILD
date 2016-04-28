# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=libsass
pkgname=python2-libsass
pkgver=0.11.1
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=(i686 x86_64)
url="http://dahlia.kr/libsass-python/"
depends=(python2 python2-six)
makedepends=(libsass)
checkdepends=()
source=(https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-${pkgver}.tar.gz)
md5sums=('e277d39d16ca0fcc0623e1ef7f5c0b05')
license=('LGPL')

build() {
	cd $srcdir/${_pythonmod}-$pkgver
	python2 setup.py build
}

check() {
	cd $srcdir/${_pythonmod}-$pkgver
	python2 setup.py test
}

package() {
	cd $srcdir/${_pythonmod}-$pkgver
	python2 setup.py install --root=$pkgdir
}

