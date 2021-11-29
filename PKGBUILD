# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='gnunet'
_modname="${_appname}-python"
pkgname="${_modname}-git"
pkgver='r44.a3707a2'
pkgrel=1
pkgdesc='GNUnet Python bindings'
arch=('any')
url="http://${_appname}.org"
license=('GPL')
conflicts=("${_modname}" "${_modname}-bin")
provides=("${_modname}")
depends=("${_appname}" 'python')
source=("git+https://git.${_appname}.org/${_modname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_modname}"
	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_modname}"
	python setup.py install --root="${pkgdir}"
}

