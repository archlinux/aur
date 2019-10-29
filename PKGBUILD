# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=pktstat
pkgver=1.8.5
pkgrel=3
pkgdesc="Real-time interface traffic viewer for curses."
arch=(i686 x86_64)
url="http://www.adaptive-enterprises.com.au/~d/software/pktstat/"
license=('custom')
# ncurses is ultimately required by libpcap
depends=('libpcap')
source=("http://ftp.ussg.iu.edu/linux/gentoo/distfiles/${pkgname}-${pkgver}.tar.gz")
md5sums=('0f387f86567eb3da1c329f7b182c3355')
sha256sums=('140b07120eb48f139d588f0d8db792a91227fc7d6e690f0fcad1328dfcafd2c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
