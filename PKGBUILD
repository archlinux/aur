# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Crocomo <crocomo@gmx.net>
# Author: Mondrian Nuessle <mondrian.nuessle@googlemail.com>
# Author: Andreas Neuper <ANeuper-at-web-dot-de>
# Author: Olivier Matheret <matheret@free.fr>
# Author: Pete Hildebrandt <send2ph@googlemail.com>

pkgname=sispmctl
pkgver=4.7
pkgrel=1
pkgdesc="Control Gembird SIS-PM programmable power outlet strips"
arch=('i686' 'x86_64')
url="http://sispmctl.sourceforge.net"
license=('GPL2')
depends=('libusb-compat')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e7d2f32f590984b6f44d758946e57776d68146e47f6cdc41d21c9218f2d2317b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

