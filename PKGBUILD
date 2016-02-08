# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Python module for the HiPack serialization format'
pkgname=('python2-hipack' 'python-hipack')
pkgbase='python-hipack'
_pkgname='hipack'
pkgver='12'
pkgrel='1'
url='http://hipack.org'
depends=()
makedepends=('python2-setuptools' 'python-setuptools')
license=('GPL3' 'MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/h/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('958c85dd852bd36fe2bd21c5d24f67eb2276130fabd624afcc4264b522ce49b7955afc41dbdb666553fc9d9b5c5c5b14a821aece6c2c275d3aca86dfe031681b')

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
