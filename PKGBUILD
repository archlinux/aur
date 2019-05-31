# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.8.2'
pkgrel='1'
pkgdesc='A small and easy to use console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7l' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('778786c0b2588f0d9a651ebfde939885a5579745dae8f5d9adc480f4895d6c04')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
