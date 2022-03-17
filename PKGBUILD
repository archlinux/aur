# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=orage
pkgver=4.16.0
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=("i686" "x86_64")
license=('GPL2')
url="https://docs.xfce.org/apps/orage/start"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libnotify' 'dbus-glib' 'libical')
makedepends=('xfce4-dev-tools')
source=("https://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha512sums=('00f5dd069a90f5398cc6789006ba503097b5246111f88e28952de4fe7927deba8e8cfb136ed1ebe8a90e1bd656116259204f25af852aa0e502be38f37459243b')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
