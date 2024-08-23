# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=cshatag
pkgver=2.2.1
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

sha256sums=('7b7b3c5e0261335c1fff8383f85beefc59ffa9d1fa762b5bd897b97a303ef401')
