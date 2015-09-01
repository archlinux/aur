# $Id$
# Maintainer: Leonardo Damián Barberón (damian01w) <damian01w@gmail.com>

pkgname=libmediaart1
_pkgname=libmediaart
pkgver=0.7.0
pkgrel=1
pkgdesc="Library tasked with managing, extracting and handling media art 
caches"
arch=('i686' 'x86_64')
conflicts=('libmediaart>=0.7.0')
license=('LGPL')
depends=('gdk-pixbuf2')
makedepends=('vala' 'gobject-introspection')
url="https://github.com/curlybeast/libmediaart"
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz)
sha256sums=('3a9dffcad862aed7c0921579b93080d694b8a66f3676bfee8037867f653a1cd3')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static --enable-gdkpixbuf --disable-qt
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

