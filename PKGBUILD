# $Id$
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Submitter: <kalterfx@gmail.com>

pkgname=gnome-screenshot-git
pkgver=3.18.0
pkgrel=1
pkgdesc="Take pictures of your screen"
arch=(i686 x86_64)
conflicts=(gnome-screenshot)
url="http://gnome.org"
license=('GPL2')
depends=('dconf' 'gtk3' 'libcanberra')
makedepends=('intltool')
groups=('gnome')
install=gnome-screenshot.install
source=('git+https://github.com/kalterfive/gnome-screenshot#branch=fix-sound')
sha256sums=('SKIP')

build() {
  cd "gnome-screenshot"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "gnome-screenshot"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

