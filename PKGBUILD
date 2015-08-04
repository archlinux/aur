# Maintainer: Uffe Jakobsen <uffe at uffe dot org>
# Past Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lnav
pkgver=0.7.3
pkgrel=1
pkgdesc="A curses-based tool for viewing and analyzing log files"
arch=(i686 x86_64)
url="http://lnav.org/"
license=('custom:BSD')
depends=('pcre' 'sqlite3')
source=("https://github.com/tstack/lnav/releases/download/v$pkgver/lnav-$pkgver.tar.gz")
md5sums=('99a58fb033af73527bd981c3397d0e1c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lnav/LICENSE"

  # man
  install -Dm644 lnav.1 "$pkgdir/usr/share/man/man1/lnav.1"
}

# vim:set ts=2 sw=2 et:

