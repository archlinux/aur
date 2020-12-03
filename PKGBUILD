# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=2.9.7
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
sha512sums=('ef5e998b3e3e552ac23696619742caff9c30e52cb2b11f75395cc6e4b2134c58df1c4a97e930db0e8c61dfc31e77b3d9a99a4c9ab6c07ae59b9e91f723401e23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

