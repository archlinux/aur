# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gnome-flashback
pkgver=3.18.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="GNOME Flashback session"
url="https://wiki.gnome.org/Projects/GnomeFlashback"
# Note: Dependencies from gnome-panel onwards are flashback session dependencies and are not required for building the flashback module
depends=('gnome-desktop' 'libcanberra' 'libpulse' 'upower' 'gnome-panel' 'gnome-screensaver' 'gnome-session' 'gnome-settings-daemon' 'metacity' 'nautilus' 'notification-daemon')
makedepends=('intltool')
optdepends=('compiz: required for the GNOME Flashback (Compiz) session')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('46d118a59057c5dbd003b97202cf3947ef2f1af383ddb5d13adf49846a4552aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/"$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

