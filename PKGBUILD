# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname='lfutils'
pkgname="${_pkgname}-git"
pkgver=r8.7f3c2e1
pkgrel=1
pkgdesc='Scripts and utilities for lf file manager.'
arch=('x86_64')
url='https://github.com/soystemd/lfutils'
license=('GPL')
depends=('lf')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
