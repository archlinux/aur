# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=usbsoftrock
pkgver=1.0.2
pkgrel=3
pkgdesc="Command line utility for interfacing with Si570 based SDR kits"
arch=('i686' 'x86_64')
url="https://code.google.com/p/usbsoftrock/"
license=('GPL')
depends=('libusb-compat' 'ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tprusak/usbsoftrock/archive/${pkgver}.tar.gz")
sha1sums=('3bdea12bda7bc9384a64563e3c218c561d6baa2b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
}
