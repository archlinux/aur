# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.6'
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
    '07a1f39831aa26c23ff635ab440983d84162156da199eaa06f0cb75149a9bbf4'
    'c39d423d9ec963e9c01ecb25501e47904a5cafb8ae2d826e2f968ab9633899f6'
)

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
