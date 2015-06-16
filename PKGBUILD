# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=usbsoftrock
pkgver=1.0.2
pkgrel=2
pkgdesc="Command line utility for interfacing with Si570 based SDR kits"
arch=('i686' 'x86_64')
url="https://code.google.com/p/usbsoftrock/"
license=('GPL')
depends=('libusb-compat' 'ncurses')
source=("https://usbsoftrock.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('e2dd8c67e2352e623d5003c401c150fe633f91e4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
}
