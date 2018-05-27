# Maintainer: copie <admin@copie.cn>

pkgname=webbench-copie
pkgver=1.5
pkgrel=2
pkgdesc="A very simple tool for benchmarking WWW or proxy servers. Uses fork() for simulating multiple clients"
arch=(i686 x86_64)
url="http://home.tiscali.cz/~cz210552/webbench.html"
license=('GPL')
makedepends=('ctags')
source=(http://home.tiscali.cz/~cz210552/distfiles/webbench-1.5.tar.gz)
md5sums=('8d02ef80b6478f33ef9bd8849c867cf3')

build() {
    cd $startdir/src/webbench-$pkgver
    sed -i  's/CFLAGS?=/CFLAGS=/' Makefile
    sed -i 's/CFLAGS=.*/& -I\/usr\/include\/tirpc/' Makefile
    make -f Makefile
}
package(){
    cd $startdir/src/webbench-$pkgver
    mkdir -p $pkgdir/usr/local/bin
    mkdir -p $pkgdir/usr/local/man/man1
    make DESTDIR="$pkgdir" install
}