# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=snappy-player
_pkgname=snappy
pkgver=1.0
pkgrel=1
pkgdesc="Powerful media player with a minimalistic interface"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Snappy"
license=('GPL')
depends=('gst-plugins-base' 'clutter-gst' 'clutter-gtk' 'desktop-file-utils')
optdepends=('gst-plugins-good: Extra media codecs'
            'gst-plugins-bad: Extra media codecs'            
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'gst-vaapi: Hardware accelerated video decode')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.xz)
sha256sums=('0d33a05c1ad3cc075b8b9bf38d45634ea5204159454597b0882dd6a8d9763f58')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
