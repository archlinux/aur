# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.4'
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
    '18e4af8ddcd1c84d623c367d04b265e5df7fb485391992d02d871b6c505bb0de'
    '86a0975d30a89d8146d9bb4763908294347a109c1096ddedcc7392bf4965718b'
)

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" NO_DEPS=1 V=1
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" NO_DEPS=1 install
}
