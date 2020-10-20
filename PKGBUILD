# Maintainer: linuxer <linuxer@artixlinux.org>
# Contributor: linuxer <linuxer@artixlinux.org>
# Maintainer: Lucas Saliés Brum <lucas at archlinux dot com dot br>
# Contributor: Tobias Frilling <tobias at frilling-online dot de>
# Contributor: Ekenbrand <jesu dot critos at gmail>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=alarm-clock-applet
pkgver=1.0.1
pkgrel=3
pkgdesc="A fully-featured alarm clock for GTK panel"
arch=('x86_64' 'i686')
alias=alarm-clock
url="http://alarm-clock.pseudoberries.com"
license=('GPL2')
depends=('autoconf' 'automake' 'gnome-common' 'gconf>=2.0' 'gnome-icon-theme' 'gstreamer>=1.0' 'libnotify>=0.4.1' 'libunique>=1.0' 'libappindicator-gtk3')
makedepends=('pkgconfig' 'intltool')
install=$pkgname.INSTALL
source=(https://gitea.artixlinux.org/linuxer/alarm-clock/archive/${pkgver}.tar.gz)
sha512sums=('SKIP')

build() {
  cd "$srcdir/$alias"
  ./autogen.sh
  autoreconf -i
  ./configure 
  make
}

package() {
  cd "$srcdir/$alias"
  make DESTDIR="$pkgdir/" install
}
