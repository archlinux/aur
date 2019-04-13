# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=streamripper
pkgver=1.64.6
pkgrel=4
pkgdesc="Records and splits streaming mp3 into tracks"
arch=('x86_64')
url="http://streamripper.sourceforge.net"
license=('GPL')
depends=('glib2' 'libmad' 'faad2' 'libvorbis')
source=("https://downloads.sourceforge.net/sourceforge/streamripper/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8477086d0099f6de861f1c47112476c427073b6e8127bbaaa2dd3e7930fe9a5c6d9b2c68d4a317f1bc0b20c625e665d5c245189049d35468aa83cf51828d4428')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
