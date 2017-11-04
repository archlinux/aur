# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.5'
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
    'a59a52bac1d7400c10a13f9b1f45c584efb90bd7315f59b70445498abed889ca'
    'e04a89a562bf54f1f80b550cb958683ae23464d3ba6bb67741fc1f8c83590d1a'
)

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
