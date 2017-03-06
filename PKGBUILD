# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Matias De la Puente <mfpuente.ar@gmail.com>

pkgname=moserial
pkgver=3.0.11
pkgrel=1
pkgdesc="Clean, friendly gtk-based serial terminal for the gnome desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/moserial"
license=('GPL3')
depends=('glib2' 'glibc' 'gtk3' 'pango')
optdepends=('lrzsz: for xmodem, ymodem and zmodem file transfer protocols'
            'yelp: help browser')
makedepends=('intltool' 'itstool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('84136f4f31c56c3f8b693ab7e40124af43cf78a027877616fd1176f8d48e37f6')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
