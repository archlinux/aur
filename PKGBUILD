# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-omx
pkgver=1.10.2
pkgrel=1
pkgdesc="Gstreamer OpenMAX IL wrapper Plugin"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-bad' 'mesa')
makedepends=('python')
options=(!libtool)
source=(https://gstreamer.freedesktop.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('c069a9cf775c92f889ca8f3b2fc718e428cd0579b7b805851a960c850a7aa497')

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
