# Maintainer: Aaron France <aaron.l.france@gmail.com>
# Contributor: veox <cy at wre dot ath dot cx>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
# Contributor: Aaron France <aaron.l.france@gmail.com>

pkgname=cl-ppcre
pkgver=2.0.11
pkgrel=2
pkgdesc="Perl-compatible, portable regexp library for Common Lisp"
arch=('i686' 'x86_64')
url="http://www.weitz.de/cl-ppcre/"
license=('BSD')
depends=('common-lisp' 'cl-asdf')
install=cl-ppcre.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/edicl/cl-ppcre/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('ed8571915216788dc4f6cdb44e49b0e0782e203ed547fe2e58cd5b0e5c57edc4'
            '47da9448a5379928cd3a56d327d7de89db1c2444498f5e5fa4878834c2538bb7')

package() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${srcdir}/${pkgname}-${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} \
        ${srcdir}/${pkgname}-${pkgver}/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgname} \
        ${srcdir}/${pkgname}-${pkgver}/*.asd
    install -m 644 ${srcdir}/LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgname}

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${pkgname}/${pkgname}.asd .
    ln -s ../source/${pkgname}/${pkgname}-unicode.asd .
}

