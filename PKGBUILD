# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=mpdris2
pkgver=0.4
pkgrel=1
pkgdesc="MPRIS2 support for MPD"
url="https://github.com/eonpatapon/mpDris2"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'python2-mpd')
makedepends=('intltool')
source=("http://mpdris2.patapon.info/mpDris2-${pkgver}/mpDris2-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mpDris2-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
  sed -i "1s/python/python2/" "src/mpDris2"
}

package() {
  cd "${srcdir}/mpDris2-${pkgver}"
  make DESTDIR="$pkgdir" install
}
sha512sums=('0bf52459844fec5b47ace79090abe7fe87456b162d4a6ca9181ce52526cdad4506de2e9745a68b4d2d074b06a5c187388b3db67438e80001c01e27baeb487dee')
