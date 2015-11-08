# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-buzztrax
pkgver=0.8.0
pkgrel=1
pkgdesc="Buzztrax gstreamer extensions (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztrax.org"
license=('LGPL')
depends=("bml>=$pkgver" 'fluidsynth' 'gst-plugins-base-libs')
provides=("gst-buzztard=$pkgver")
conflicts=('gst-buzztard')
replaces=('gst-buzztard')
source=("https://downloads.sourceforge.net/buzztard/buzztard%20gstreamer%20extensions/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
