# Maintainer: Jan Hicken <firstname [dot] lastname [at] hotmail [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.3.1
pkgrel=1
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=(networkmanager strongswan libgnomeui)
source=(http://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.gz)
sha256sums=('8f67bf0e7281ee8dfb1c7fe28ef8d06774744e2135682f4ddae4342fd103d46a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
