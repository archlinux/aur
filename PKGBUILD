# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.3'
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
    '5656bb1cf45c0d14109ec82d55456a79f4fd30da6d78bc792ca253e6a6baaa5b'
    '1c1386afad2e95d7dfef46f580ad82c09ad210344184ad68b71b74e671152d07'
)

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" NO_DEPS=1 V=1
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" NO_DEPS=1 install
}
