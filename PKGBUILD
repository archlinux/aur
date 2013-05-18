# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.3
pkgrel=1
pkgdesc="a graphical CD ripper and encoder"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gtk2' 'libcddb' 'cdparanoia' 'desktop-file-utils')
makedepends=('pkgconfig' 'intltool' 'gettext')
optdepends=('lame: for mp3 support' 'vorbis-tools: for ogg support' \
	'flac: for flac support')
source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dd690d8f4c68a2e786c657e08be688d0')
sha256sums=('ded2eff22c7e65f46eecd8ad89c6c37c5a032af280e293a59c3e5bb34c0bb05f')
install="$pkgname".install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

