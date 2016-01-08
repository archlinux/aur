# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=libdop-git
pkgver=r2.09cc0d7
pkgrel=1
pkgdesc='Utilities library'
arch=('x86' 'x86_64')
url='http://github.com/dopsi/libdop'
license=('GPL')
provides=('libdop')
conflicts=('libdop')
depends=('glibc')
source=('git://github.com/dopsi/libdop')
sha1sums=('SKIP')

_gitname=libdop

pkgver() {
    cd $_gitname
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:ts=4:sw=4:expandtab
