# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=cshatag
pkgver=2.2.0
pkgrel=1
pkgdesc='Detect silent data corruption using checksums in Ext4 extended attributes'
arch=('x86_64')
url="https://github.com/rfjakob/cshatag"
makedepends=('bats' 'go')
optdepends=('attr: Inspect extended file attributes')
license=('MIT')
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
    make test
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -vDm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -vDm 644 cshatag.1    "${pkgdir}/usr/share/man/man1/cshatag.1"
    install -vDm 644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -vDm 644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

sha256sums=('02c80ab8fe21a06206e6e2216724ad4882d7bc527fac71ff1e5e80f0a5c92964')
