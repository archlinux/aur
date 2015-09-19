# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Python module for the HiPack serialization format'
pkgname=('python2-hipack' 'python-hipack')
pkgbase='python-hipack'
_pkgname='hipack'
pkgver='9'
pkgrel='1'
url='http://hipack.org'
depends=()
makedepends=('python2-setuptools' 'python-setuptools')
license=('GPL3' 'MIT')
arch='any'
source=("https://pypi.python.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('52d43cc25382d75496799f86c6a6d2da')

package_common () {
	python$1 setup.py install --optimize=1 --root="${pkgdir}"
	mv "${pkgdir}/usr/bin"/hipack{,$1}
}

package_python-hipack () {
	depends+=('python')
	cd "${_pkgname}-${pkgver}"
	package_common 3
}

package_python2-hipack () {
	depends+=('python2')
	cd "${_pkgname}-${pkgver}"
	package_common 2
}
