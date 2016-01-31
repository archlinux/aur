# $Id: PKGBUILD 137547 2015-07-28 09:44:47Z arodseth $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Valère Monseur (valr) <valere dot monseur at ymail dot com>

pkgname=cbatticon-gtk2
_pkgname=cbatticon
pkgver=1.6.2
pkgrel=1
pkgdesc='Lightweight and fast battery icon that sits in your system tray'
arch=('x86_64' 'i686')
url='https://github.com/valr/cbatticon'
license=('GPL2')
depends=('libnotify' 'gtk2')
provides=('cbatticon')
conflicts=('cbatticon')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/valr/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('fd78c2a38441f78116b68dbef67c8ab67d323d781206a76a3fe5cc09f4bce1ee')

build() {
  make -C "$_pkgname-$pkgver" WITH_NOTIFY=1 WITH_GTK3=0
}

package() {
  make -C "$_pkgname-$pkgver" PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
