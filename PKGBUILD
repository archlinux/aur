# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.2'
pkgrel='1'
pkgdesc='A small and easy to use text editor'
url='https://github.com/craigbarnes/dte'
arch=('i686' 'x86_64' 'armv7l')
license=('GPL2')
depends=('glibc' 'ncurses')
source=("https://craigbarnes.gitlab.io/dte/dist/dte-$pkgver.tar.gz")
md5sums=('f93a7efa6e167be466b90fc11c8646c6')
sha1sums=('b0dbf08694e920ca8730b7630a2cb8e975995597')

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" V=1
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" install
}
