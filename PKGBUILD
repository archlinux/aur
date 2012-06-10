# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

pkgname=ccid
pkgver=1.4.6
pkgrel=2
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver"
arch=('i686' 'x86_64')
url="http://pcsclite.alioth.debian.org/ccid.html"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusbx')
makedepends=('pkg-config')
backup=(etc/reader.conf.d/libccidtwin)
source=("https://alioth.debian.org/frs/download.php/3711/${pkgname}-${pkgver}.tar.bz2")
md5sums=('3600dfbc74efb321c37de15a64efbbe6')

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
