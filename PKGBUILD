# Maintainer: Evaggelos Balaskas <aur.archlinux.org@disposable.space>

pkgname=forkstat
pkgdesc="logs process fork(), exec() and exit() activity."

pkgver=0.03.02
pkgrel=1

arch=('x86_64')
license=('GPL2')

makedepends=('make' 'gcc')

url="https://github.com/ColinIanKing/${pkgname}"

source=("${url}/archive/V${pkgver}.tar.gz")

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

sha256sums=('eaa4d69d674cf8871db01272d1d7d82005cc5595f83ed948e5fd24d571c78cd2')
