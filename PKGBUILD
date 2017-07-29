# Maintainer: Craig Barnes <cr@igbarn.es>

pkgname='dte'
pkgver='1.1'
pkgrel='1'
pkgdesc='A small and easy to use text editor'
url='https://github.com/craigbarnes/dte'
arch=('i686' 'x86_64' 'armv7l')
license=('GPL2')
depends=('glibc' 'ncurses')
source=('https://craigbarnes.gitlab.io/dte/dist/dte-1.1.tar.gz')
md5sums=('11e0a9e57f2be966bfa91c1db8205879')
sha1sums=('f62eb1606a69c0373ff302c533f36308ba94b08f')

build() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" V=1
}

package() {
    cd "$pkgname-$pkgver"
    make prefix=/usr DESTDIR="$pkgdir" install
}
