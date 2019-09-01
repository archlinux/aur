# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.9.4
pkgrel=1
pkgdesc="a graphical CD ripper and encoder"
arch=('x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gtk2' 'libcddb' 'cdparanoia')
makedepends=('pkgconfig' 'intltool' 'gettext')
optdepends=(
  'lame: for mp3 support'
  'vorbis-tools: for ogg support'
  'flac: for flac support'
)
source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('9410b96f27e7ea46e7a3f290caf17ddee69da9b92770346e10ae8e9403d21a527ba763163cf92e879cefb32f219e7d22d3f9b4dc2d81a3aab2a7676b859cfb71')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

