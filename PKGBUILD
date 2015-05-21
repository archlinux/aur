pkgname=linux-identd
pkgver=1.3
pkgrel=7
pkgdesc="A user identification daemon for Linux"
arch=('i686' 'x86_64')
url="http://www.fukt.bsnet.se/~per/identd/"
license=('GPL')
source=(http://distro.ibiblio.org/pub/linux/distributions/sourcemage/mirror/linux-identd-$pkgver.tar.gz
        identd)
md5sums=('c3517f612b351e46951d2ecb0c60b767'
         'd429efff1b7256f8436568abe93a587d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/sbin/in.identd"
  install -Dm644 "$srcdir/identd" "$pkgdir/etc/xinetd.d/identd"
}

# vim:set ts=2 sw=2 et:
