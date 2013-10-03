# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.12
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusbx')
makedepends=('pkg-config')
backup=(etc/reader.conf.d/libccidtwin)
source=("https://alioth.debian.org/frs/download.php/file/3937/${pkgname}-${pkgver}.tar.bz2")
md5sums=('54a314b60b60a9549febc75b6dc516d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-twinserial
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
