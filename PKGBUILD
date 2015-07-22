# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-garbage
_clname=trivial-garbage   # used in CL scope, not package scope
pkgver=0.20
pkgrel=1
pkgdesc="Provides a portable API to finalizers, weak hash-tables and weak pointers on all major implementations of the Common Lisp programming language"
arch=('i686' 'x86_64')
url="https://common-lisp.net/project/trivial-garbage/"
license=('BSD')

depends=('common-lisp')

install=cl-trivial-garbage.install
source=("https://github.com/trivial-garbage/trivial-garbage/archive/v0.20.tar.gz")
md5sums=('fa4c768866c7a2b76c43422233bea5d0')
options=(docs)


package() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
        install -d ${pkgdir}/usr/share/common-lisp/systems
#	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${pkgver}/*.asd
#	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
#		${srcdir}/${pkgname}-${pkgver}/COPYING

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}
