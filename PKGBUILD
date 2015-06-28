# $Id: PKGBUILD 123201 2014-11-27 12:40:50Z arodseth $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Valère Monseur (valr) <valere dot monseur at ymail dot com>

pkgname=cbatticon-gtk2
_pkgname=cbatticon
pkgver=1.4.2
pkgrel=1
pkgdesc='Lightweight and fast battery icon that sits in your system tray'
arch=('x86_64' 'i686')
url='https://github.com/valr/cbatticon'
license=('GPL2')
depends=('libnotify' 'gtk2')
provides=('cbatticon')
conflicts=('cbatticon')
source=("https://github.com/valr/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('987d979c426c12d7ef6ce7856a7c0d0d0a70720cafcada9ba6a4800d048ef502')

build() {
  make -C "$_pkgname-$pkgver" WITH_NOTIFY=1 WITH_GTK3=0
}

package() {
  make -C "$_pkgname-$pkgver" PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
