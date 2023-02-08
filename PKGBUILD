# Maintainer: Evaggelos Balaskas <aur.archlinux.org@disposable.space>

pkgname=forkstat
pkgdesc="logs process fork(), exec() and exit() activity."

pkgver=0.03.01
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

sha256sums=('50aa399468ba9b6729bf6eed4a746b447412bb1991228b4ee89a29c05d0871b9')
