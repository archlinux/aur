# Maintainer: Evaggelos Balaskas <aur.archlinux.org@disposable.space>

pkgname=faultstat
pkgdesc="page fault tracking tool"

pkgver=0.01.11
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

sha256sums=('208d83cdb1710a9dfae557536e4667bee29343cbc6acb524d85d52791726b9d9')