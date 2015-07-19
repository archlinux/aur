# Contributor:  Peter Mukhachev <rolling[dot]robot [shift-two] gmail [dot] com>

pkgname=cl-babel
_clname=babel    # used in CL scope, not package scope
pkgver=0.5.0
pkgrel=1
pkgdesc="A charset encoding/decoding library, not unlike GNU libiconv, written in Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/babel/"
license=('BSD')
depends=('common-lisp' 'cl-trivial-features' 'cl-trivial-gray-streams' 'cl-alexandria')
install=cl-babel.install
source=("http://common-lisp.net/project/babel/releases/${_clname}_${pkgver}.tar.gz")
md5sums=('17983533872983573d1646b2e66d1fe4')


package() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${srcdir}/${_clname}_${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/src \
        ${srcdir}/${_clname}_${pkgver}/src/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests \
        ${srcdir}/${_clname}_${pkgver}/tests/*
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
        ${srcdir}/${_clname}_${pkgver}/*.asd

    install -m 644 ${srcdir}/${_clname}_${pkgver}/COPYRIGHT \
        ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-streams.asd .
    ln -s ../source/${_clname}/${_clname}-tests.asd .
}

# vim:set ts=2 sw=4 et nospell:
