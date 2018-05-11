# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.7'
pkgrel='2'
pkgdesc='A small and easy to use console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7l' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('6cd070037d9c6f4b4f3b5bedd78183dde5f8e79811ccdf04b0e7abafe5fdc33d')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
