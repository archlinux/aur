# Maintainer: Sven Kadak <sven.kadak [symbol-used-in-emails] g m a i l [D0T] c o m>

pkgname=cluttermm
pkgver=1.23.1
pkgrel=1
pkgdesc='C++ wrappers for clutter'
arch=('i686' 'x86_64')
url='https://developer.gnome.org/cluttermm/'
license=('LGPL2.1')
depends=('clutter' 'atkmm' 'pangomm')
makedepends=('mm-common' 'git')
_commit=e261355c656ccea39bc7e3851ebc031d0734398c
source=(https://github.com/GNOME/cluttermm/archive/$_commit.tar.gz)
sha256sums=('bd09e687fbc627b18f21f700b3d94ec5c37ec8c3f1e97527ea92714e2198d61e')

prepare() {
    cd $pkgname-$_commit
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $pkgname-$_commit
    ./configure \
        --prefix=/usr \
        --enable-maintainer-mode \
        --disable-documentation
    make
}

package() {
    cd $pkgname-$_commit
    make DESTDIR=$pkgdir install
}
