# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.7'
pkgrel='1'
pkgdesc='A small and easy to use console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7l' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc' 'ncurses')
validpgpkeys=('A3FB922E15870DA250D9DCE1FBCC7A6B0330BEB4')

source=(
    "https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz"
    "https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz.sig"
)

sha256sums=(
    '6cd070037d9c6f4b4f3b5bedd78183dde5f8e79811ccdf04b0e7abafe5fdc33d'
    '8d0ea0c123b250405c4e0152bd7a6558d75fb775b16f617edda50a0ac8994994'
)

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
