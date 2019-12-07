# Maintainer: Craig Barnes <cr@igbarn.es>
pkgname='dte'
pkgver='1.9.1'
pkgrel='2'
pkgdesc='A small, configurable console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('80d2732269a308b5e1126ecc16c28cda032864f625a95184821a73c054f81a2d')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
