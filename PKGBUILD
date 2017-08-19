# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.2'
pkgrel='1'
pkgdesc='A small and easy to use text editor'
url='https://github.com/craigbarnes/dte'
arch=('i686' 'x86_64' 'armv7l')
license=('GPL2')
depends=('glibc' 'ncurses')
validpgpkeys=('A3FB922E15870DA250D9DCE1FBCC7A6B0330BEB4')

source=(
    "https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz"
    "https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz.sig"
)

sha256sums=(
    '06460364cfbba6e64fecba46012931d238308aa7ea8b5fd21a51b0c2e22e94ea'
    SKIP
)

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" V=1
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" install
}
