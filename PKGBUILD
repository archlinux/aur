# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.9.6
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
sha512sums=('336514c964c2b46bf93aea050d771b6954c0761c4d9ebd63627a97945ac0c6eb8389e49abb5b42fffe8c646adc281785c7fc3b937b8dbd97e65d6b5834477633')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

