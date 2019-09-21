# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.9'
pkgrel='1'
pkgdesc='A small and easy to use console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=('x86_64' 'i686' 'armv7l' 'armv7h' 'aarch64')
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://craigbarnes.gitlab.io/dist/dte/dte-$pkgver.tar.gz")
sha256sums=('79510df2b9e7039f33976ca0e0040f98493e9c2bfecdfbcd0bb39cbe54468788')

build() {
    cd "$pkgname-$pkgver"
    make V=1
}

package() {
    cd "$pkgname-$pkgver"
    make install V=1 prefix=/usr DESTDIR="$pkgdir"
}
