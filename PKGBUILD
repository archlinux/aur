# Maintainer: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=posixovl
pkgver=1.4
pkgrel=1
pkgdesc='A FUSE filesystem that provides POSIX functionality, a modern equivalent to UMSDOS'
arch=(i686 x86_64 armv7h armv6h)
url="https://inai.de/projects/posixovl/"
license=('GPL2')
depends=('fuse')
provides=()
source=(https://codeberg.org/jengelh/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha1sums=('26189531d1c56ca1180fced165ad2e834bf35507')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}

#category: system
# vim:set ts=2 sw=2 et:
