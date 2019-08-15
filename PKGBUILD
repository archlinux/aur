# Maintainer:  Evaggelos Balaskas <evaggelos [_AT_] balaskas [_DOT]_ gr>
pkgname=faultstat
pkgdesc="page fault tracking tool"

pkgver=0.01.02
pkgrel=1

arch=('x86_64')
license=('GPL2')

makedepends=(
    'make'
    'gcc'
)

url="https://github.com/ColinIanKing/${pkgname}"

source=(
    ${url}/archive/V${pkgver}.tar.gz
)

sha256sums=(
    '4403a82f37e49b0f5d674230686465500fd3b138d6b5414e9b3de7b9a6dea57a'
)

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname}.8 "$pkgdir/usr/share/man/man8/${pkgname}.8"
}

# vim: sts=2 sw=2 ts=2 et