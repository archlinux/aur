# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-omx
pkgver=1.2.0
pkgrel=1
pkgdesc="Gstreamer OpenMAX IL wrapper Plugin"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-bad' 'mesa')
options=(!libtool)
source=(${url}/src/$pkgname/$pkgname-$pkgver.tar.xz)
#http://gstreamer.freedesktop.org/src/gst-omx/
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
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
