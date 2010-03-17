# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=1.9.1
pkgrel=2
pkgdesc="a graphical CD ripper and encoder"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gtk2' 'libcddb' 'cdparanoia')
makedepends=('pkgconfig')
optdepends=('lame: for mp3 support' 'vorbis-tools: for ogg support' \
	'flac: for flac support')
source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
md5sums=('91e1939978e4379f1328d8ededf4bb06')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1 
  make DESTDIR=${pkgdir} install  || return 1
}
