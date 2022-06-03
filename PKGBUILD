# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=pidgin-znchelper
_pkgname=pidgin-znc-helper
pkgver=1.10
pkgrel=1
pkgdesc='Pidgin plugin, removing double-timestamps when replaying messages from ZNC'
arch=('i686' 'x86_64')
url='https://github.com/kgraefe/pidgin-znc-helper'
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/kgraefe/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('25e144dd495b57bc4bb59912a67a676f03d49e4bc3681b240b9477e8e13e1267')

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
