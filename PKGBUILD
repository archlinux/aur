# vim:ts=4:sw=4:expandtab
pkgname=mkb-git
pkgver=latest
pkgrel=2
pkgdesc='progress bar maker'
arch=('i686' 'x86_64')
url='http://git.2f30.org/mkb/'
license=('unknown')
provides=('mkb')
conflicts=()
#groups=
depends=()
makedepends=('git')
source=('git://git.2f30.org/mkb.git')
sha1sums=('SKIP')

_gitname='mkb'

build() {
    cd "$_gitname"

    rm Makefile
    cp ../../Makefile.new Makefile

    make clean
    make all
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" MANPREFIX="/usr/share/man" install
}
