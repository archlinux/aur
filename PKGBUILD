# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-omx
pkgver=1.10.4
pkgrel=1
pkgdesc="Gstreamer OpenMAX IL wrapper Plugin"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-bad' 'mesa')
makedepends=('python')
options=(!libtool)
source=(https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('45072925cf262f0fd528fab78f0de52734e46a5a88aa802fae51c67c09c81aa2')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-experimental \
    --with-package-name="GStreamer OpenMAX IL wrapper Plugin (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-omx-target=generic
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
