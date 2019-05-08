# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=posixovl
pkgver=1.3
pkgrel=1
pkgdesc='A FUSE filesystem that provides POSIX functionality, a modern equivalent to UMSDOS'
arch=(i686 x86_64 armv7h armv6h)
url="http://sourceforge.net/projects/posixovl/"
license=('GPL2')
depends=('fuse')
provides=()
source=(https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.xz)
sha1sums=('c6b868f5a0b3ff0d316759214fe69dbd1fec694b')

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
