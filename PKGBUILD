# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=pidgin-znchelper
_pkgname=pidgin-znc-helper
pkgver=1.9
pkgrel=1
pkgdesc='Pidgin plugin, removing double-timestamps when replaying messages from ZNC'
arch=('i686' 'x86_64')
url='https://github.com/kgraefe/pidgin-znc-helper'
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/kgraefe/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('be84f8b5ee32c9352bb1c600fd7d6014')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
