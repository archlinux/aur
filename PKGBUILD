# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=libsass
pkgname=python2-libsass
pkgver=0.13.5
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=(i686 x86_64)
url="http://dahlia.kr/libsass-python/"
depends=(python2 python2-six)
makedepends=(libsass)
checkdepends=()
source=(https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-${pkgver}.tar.gz)
md5sums=('a400dc2db9c252483b22a6c13dbb7955')
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

