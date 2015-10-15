# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gnome-flashback
pkgver=3.18.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="GNOME Flashback session"
url="https://wiki.gnome.org/Projects/GnomeFlashback"
# Note: Dependencies from gnome-panel onwards are flashback session dependencies and are not required for building the flashback module
depends=('gnome-desktop' 'libcanberra' 'libpulse' 'upower' 'gnome-bluetooth' 'ibus' 'gnome-panel' 'gnome-screensaver' 'gnome-session' 'gnome-settings-daemon' 'metacity' 'nautilus' 'notification-daemon')
makedepends=('intltool')
optdepends=('compiz: required for the GNOME Flashback (Compiz) session')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('30413730ba5216e577d6c76445cfa4fe9efaef43c54f3a42a9879107156641f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/"$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

