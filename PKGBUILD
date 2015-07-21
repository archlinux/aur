# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-iterate
_clname=iterate   # used in CL scope, not package scope
pkgver=20140713_darcs
_pkgver=20140713-darcs
pkgrel=1
pkgdesc="iterate is an iteration construct for Common Lisp."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/iterate/"
license=('BSD')
depends=('common-lisp')
install=cl-iterate.install
source=("http://beta.quicklisp.org/archive/iterate/2014-07-13/iterate-20140713-darcs.tgz")
md5sums=('f3d8e9eb6a9241bb1303c9708a37ade4')
options=(docs)


package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
        install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${_pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${_pkgver}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}
