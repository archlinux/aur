# Maintainer: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Ekenbrand <jesu dot critos at gmail>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=alarm-clock-applet
pkgver=0.3.4
pkgrel=1
pkgdesc="A fully-featured alarm clock for GNOME panel"
arch=('x86_64' 'i686')
url="http://alarm-clock.pseudoberries.com"
license=('GPL2')
depends=('gconf>=2.0' 'gnome-icon-theme' 'gstreamer>=1.0' 'libnotify>=0.4.1' 'libunique>=1.0')
makedepends=('pkgconfig' 'intltool')
optdepends=('libappindicator: library to allow applications to export menus into the Unity Menu bar')
install=$pkgname.INSTALL
source=(http://launchpad.net/alarm-clock/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha1sums=('c7e70fd6367b16eaf8590fb74aa64844b72a27a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
