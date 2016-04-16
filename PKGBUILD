# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gustavo Chain <g@0xff.cl>
# Contributor: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>

# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
pkgname=lib-lightblue-pebble-git
_dwname=lightblue
pkgver=0.4.r30.86b5c89
_dwver=0.4
pkgrel=1
pkgdesc="LightBlue is a cross-platform Bluetooth API for Python which provides simple access to Bluetooth operations; Pebble fork"
conflicts=(lib-lightblue lib-lightblue-pebble)
provides=(lib-lightblue)
arch=('i686' 'x86_64')
url="http://lightblue.sourceforge.net/"
license=('GPL3')
depends=('python2' 'python2-pybluez' 'openobex')
source=(git+https://github.com/pebble/${_dwname}-${_dwver}.git)
md5sums=(SKIP)

pkgver() {
	cd ${srcdir}/${_dwname}-${_dwver}
	printf "${_dwver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd ${srcdir}/${_dwname}-${_dwver}
	python2 setup.py install --root=${pkgdir}
}
