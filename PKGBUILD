pkgname=python2-dfvfs
_realname=dfvfs
pkgver=20160510
pkgrel=1
pkgdesc="Digital Forensics Virtual File System (dfVFS)"
url="https://github.com/log2timeline/dfvfs"
license=('Lesser GPL')
arch=('i686' 'x86_64')
depends=('python2')
options=()
source=(https://github.com/log2timeline/${_realname}/archive/${pkgver}.zip)

md5sums=(9cd0d062027a9941f6fd087bc9f5a0e4)

build() {
	export PYTHON=python2
	cd "$srcdir"/${_realname}-${pkgver}

	python2 setup.py build
}

package() {
	cd "$srcdir"/${_realname}-${pkgver}
	python2 setup.py install --root="${pkgdir}"
}
