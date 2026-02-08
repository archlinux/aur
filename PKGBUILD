# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=3.0.2
pkgrel=1
pkgdesc="a graphical CD ripper and encoder"
arch=(x86_64)
url="http://littlesvr.ca/asunder/"
license=(GPL-2.0-only)
depends=(gdk-pixbuf2 glib2 glibc gtk2 libcddb cdparanoia)
makedepends=(intltool gettext)
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
sha512sums=('9f75a923b152a3c4ba2abb495eb06bbdc2ce8fc0ec120ebc92221ad7c165c994260b28ac3fa121b200998deb349bfdfc5386b72bdf8e3005197b02bf502f60b1')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

