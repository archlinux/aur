# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.0
pkgrel=1
pkgdesc="a graphical CD ripper and encoder"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gtk2' 'libcddb' 'cdparanoia')
makedepends=('pkgconfig')
optdepends=('lame: for mp3 support' 'vorbis-tools: for ogg support' \
	'flac: for flac support')
source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
md5sums=('edde25d364c119d012f4286d7adc4dff')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make || return 1 
  make DESTDIR="${pkgdir}" install  || return 1
}

