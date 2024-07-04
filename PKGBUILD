# Maintainer: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=3.0.1
pkgrel=2
pkgdesc="a graphical CD ripper and encoder"
arch=('x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'libcddb' 'cdparanoia')
makedepends=('pkgconfig' 'intltool' 'gettext')
optdepends=(
  'lame: for mp3 support'
  'vorbis-tools: for ogg support'
  'fdkaac: for mp3 support'
  'flac: for flac support'
  'opus-tools: for opus support'
  'wavpack: for wavpack support'
  'musepack-tools: for musepack support'
  'mac: for monkey audio support'
)

source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('07b4caa80c35b39f407952276237787561100e1f546637b64119741f75385afe8db43a991cce364fb152ed5d20b9a9ac99a972b6cbb9616073dada2e2d048b74')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

