# Maintainer: Thibault Saunier <tsaunier@gnome.org>

pkgname=gst-transcoder
pkgver=1.8.0
pkgrel=0
pkgdesc="GStreamer Transcoding API"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-base-libs')
makedepends=('meson')
options=(!libtool !emptydirs)

source=(https://github.com/pitivi/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('e63923e29f57fd40d9cab75079867a73052c0775705ee3b4abecdcdaa2c9ef45')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=lib/
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
