# Maintainer:  Evaggelos Balaskas <evaggelos [_AT_] balaskas [_DOT]_ gr>
pkgname=forkstat
pkgdesc="logs process fork(), exec() and exit() activity."

pkgver=0.02.11
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
    '357518689e3f93b77dea7efcf61171b874d44eb8f32be61ac281672b84bbfcbb'
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