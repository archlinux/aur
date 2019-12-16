# $Id: PKGBUILD 137547 2015-07-28 09:44:47Z arodseth $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Valère Monseur (valr) <valere dot monseur at ymail dot com>

pkgname=cbatticon-gtk2
_pkgname=cbatticon
pkgver=1.6.10
pkgrel=1
pkgdesc='Lightweight battery icon for the system tray (gtk2)'
arch=(x86_64 i686)
url='https://github.com/valr/cbatticon'
license=(GPL2)
depends=(libnotify gtk2)
provides=(cbatticon=1.6.9-1)
conflicts=(cbatticon)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/valr/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('c9782e86dab64bea17583640f23e9fda34682967984f2105aa21e0d1c355cd57')

build() {
  make -C "$_pkgname-$pkgver" WITH_NOTIFY=1 WITH_GTK3=0
}

package() {
  make -C "$_pkgname-$pkgver" PREFIX="$pkgdir/usr" install
}

# getver: github.com/valr/cbatticon
# vim: ts=2 sw=2 et:
