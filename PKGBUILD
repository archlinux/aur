# Maintainer: bzt <unmacaque at gmail dot com>
# Contributor: Marcos Paulino Roriz Junior <marcosrorizinf at gmail dot com>

pkgname=gnome-nds-thumbnailer
pkgver=3.0.0
pkgrel=4
pkgdesc="A thumbnailer for GNOME that will make thumbnails for Nintendo DS roms by extracting their preview icon."
arch=('i686' 'x86_64')
url="http://www.hadess.net"
depends=('gdk-pixbuf2' 'glib2>=2.16')
optdepends=('nautilus: required for better use of the schema')
license=('GPL2')
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/3.0/$pkgname-$pkgver.tar.xz")
md5sums=('04efed71fd5311a844040630f07f4167')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  ./configure --prefix=/usr
  
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  make DESTDIR=$pkgdir install
}
