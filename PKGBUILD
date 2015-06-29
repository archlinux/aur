# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=pidgin-sound
pkgver=1.2.1
pkgrel=1
pkgdesc="A plugin that adds sounds for some sound notifications to pidgin (e.g. 'Incoming Filetransfer' or 'Authentication requested')"
arch=('i686' 'x86_64')
url="http://pidgin-sound.sourceforge.net/"
license=('GPL')
depends=('pidgin')
makedepends=('intltool')
source=(http://launchpad.net/pidgin-advanced-sound-notification/trunk/$pkgver/+download/pidgin-advanced-sound-notification-$pkgver.tar.gz)
md5sums=('542de11129bcf893f1626185f780c16f')
_pkgname=pidgin-advanced-sound-notification
build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --prefix=/usr
    make || return 1
}
package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
