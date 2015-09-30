# Maintainer: Anatol Pomozov 
# Contributor: Reza Jelveh (reza.jelveh@tuhh.de)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname=horst
pkgver=4.2
pkgrel=1
pkgdesc='A small, lightweight IEEE802.11 wireless LAN analyzer with a text interface'
arch=(i686 x86_64)
url='http://br1.einfach.org/tech/horst'
depends=(ncurses iw)
license=(GPL)
source=(http://br1.einfach.org/horst_dl/horst-$pkgver.tar.gz)
sha256sums=('eab46330998a4c6d5abc9bfdad739b62b57c65049ac6f160e58ee3edd3260057')

build() {
  cd horst-$pkgver
  make
}

package() {
  cd horst-$pkgver

  install -Dm755 horst "$pkgdir/usr/bin/horst"
  install -Dm644 horst.1 "$pkgdir/usr/share/man/man1/horst.1"
}
