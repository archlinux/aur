# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-yacc
_clname=yacc   # used in CL scope, not package scope
pkgver=0.3
pkgrel=1
pkgdesc="LALR(1) parser generator for Common Lisp, somewhat like Zebu or LALR.cl"
arch=('i686' 'x86_64')
url="http://www.pps.univ-paris-diderot.fr/~jch/software/cl-yacc/"
license=('BSD')

depends=('common-lisp')

install=cl-yacc.install
source=("https://github.com/jech/cl-yacc/archive/cl-yacc-0.3.tar.gz")
md5sums=('39c943108ca4ac520d377712b8143de9')
options=(docs)


package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
        install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${pkgname}-${pkgname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${pkgname}-${pkgname}-${pkgver}/*.asd
	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${pkgname}-${pkgname}-${pkgver}/COPYING

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}
