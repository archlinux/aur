# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Crocomo <crocomo@gmx.net>
# Author: Mondrian Nuessle <mondrian.nuessle@googlemail.com>
# Author: Andreas Neuper <ANeuper-at-web-dot-de>
# Author: Olivier Matheret <matheret@free.fr>
# Author: Pete Hildebrandt <send2ph@googlemail.com>

pkgname=sispmctl
pkgver=4.6
pkgrel=1
pkgdesc="Control Gembird SIS-PM programmable power outlet strips"
arch=('i686' 'x86_64')
url="http://sispmctl.sourceforge.net"
license=('GPL2')
depends=('libusb-compat')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3769c0c2d80747adbced63ccb95e073917e653521a3925eae914b7ea796d2f0b')

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

