# Maintainer: Andreas Baumann <mail@andreasbauamnn.cc>

pkgname=lbforth
pkgver=20241115
pkgrel=1
pkgdesc="A minimal Forth compiler in C."
arch=('x86_64')
url="https://github.com/DosWorld/lbforth"
license=('custom:Public Domain')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DosWorld/${pkgname}/archive/refs/tags/RELEASE-${pkgver}.tar.gz")
sha512sums=('d46c4580d1a1688c6287a428a20ed6d7d5def1cac797f6faeb58cd3c01244880e2cff5f0acff38b13ea1f31474dfd415ed0835b273d0b6d881d0dc4b04b9f8c8')

build() {
    cd "${pkgname}-RELEASE-${pkgver}/SRC"
    cc ${CFLAGS} -o lbforth lbforth.c
}

package() {
    cd "${pkgname}-RELEASE-${pkgver}"
    install -dm644 "${pkgdir}/usr/bin"
    install -Dm775 SRC/lbforth "$pkgdir/usr/bin/."

    install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
