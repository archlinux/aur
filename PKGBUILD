# Author: Mondrian Nuessle <mondrian.nuessle@googlemail.com>
# Author: Andreas Neuper <ANeuper-at-web-dot-de>
# Author: Olivier Matheret <matheret@free.fr>
# Author: Pete Hildebrandt <send2ph@googlemail.com>
# Maintainer: Crocomo <crocomo@gmx.net>

pkgname=sispmctl
pkgver=3.1
pkgrel=2
pkgdesc="Enabling the use of the Gembird SIS-PM Silver Shield device family"
arch=('i686' 'x86_64')
url="http://sispmctl.sourceforge.net/"
license=('GPL')
depends=('libusb-compat')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('24693cae30d77c957f34cfb2c8159661')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-webless
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

