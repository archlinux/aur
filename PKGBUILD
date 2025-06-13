# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gnustep-pdfkit
_pkgname=PDFKit
pkgver=1.2.0
pkgrel=1
pkgdesc="GNUstep PDF rendering framework based on xpdf"
arch=("x86_64")
url="https://gap.nongnu.org/pdfkit/"
license=('GPL-2.0-only')
depends=(freetype2 gnustep-base gnustep-gui)
makedepends=('gcc-objc' 'gnustep-make')
source=(http://savannah.nongnu.org/download/gap/PDFKit-${pkgver}.tar.gz)
md5sums=('d6326e4c8685c4e4c0a4b7980f2a712d')

_gnustep() {
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
}

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  _gnustep && ./configure
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  _gnustep && make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  _gnustep && make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
