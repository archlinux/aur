# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.2
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
md5sums=('4996860f552879fd8abdc87d1c6c7530')
sha256sums=('bb608c1cdefcce2f533fb5d5cc23838846b2810ec89d0ebb083507cf27e7822f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

