# Maintainer: yokirinjin <aur.country952@passmail.com>
# Contributor: yokirinjin <aur.country952@passmail.com>

pkgname=xfce4-mixer
pkgver=4.18.1
pkgrel=1
pkgdesc='A volume control application based on GStreamer'
arch=('x86_64')
url='https://docs.xfce.org/apps/xfce4-mixer'
license=('GPL2')
depends=('xfce4-panel' 'alsa-lib>=1.2.1' 'gstreamer')
makedepends=('intltool')
source=("https://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha256sums=('b27f67dccc9dd67d989b405dab02be1299436dd71b58edb88a1d5f82571ead95')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug
  make
}

package () {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
