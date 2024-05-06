# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Crocomo <crocomo at gmx dot net>
# Author: Mondrian Nuessle <mondrian dot nuessle at googlemail dot com>
# Author: Andreas Neuper <ANeuper-at-web-dot-de>
# Author: Olivier Matheret <matheret at free dot fr>
# Author: Pete Hildebrandt <send2ph at googlemail dot com>

pkgname=sispmctl
pkgver=4.12
pkgrel=1
pkgdesc="Control Gembird SIS-PM programmable power outlet strips"
arch=('i686' 'x86_64')
url="https://sispmctl.sourceforge.net"
license=('GPL2')
depends=('libusb-compat')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e757863a4838da6e1ca72a57adc5aca6fc47ffbddc72a69052d8abd743d57082')

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

