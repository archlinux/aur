# Maintainer: envolution
# Contributor: grimi <grimi at poczta dot fm>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=uade
pkgver=3.05
pkgrel=1
pkgdesc="Unix Amiga Delitracker Emulator"
arch=('i686' 'x86_64')
url="https://zakalwe.fi/uade"
license=('LicenseRef-(L)GPL-various')
depends=('libao' 'bencodetools' 'libzakalwe')
install=uade.install
source=("https://zakalwe.fi/uade/uade3/$pkgname-$pkgver.tar.bz2")
md5sums=('efc5f7ff638b227a2b4ce0cea3e5562a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --package-prefix="$pkgdir" --without-write-audio
  make
}

package() {
  cd $pkgname-$pkgver
  make install
  install -Dm644 COPYING.LGPL $pkgdir/usr/share/licenses/$pkgname/COPYING.LGPL
  install -Dm644 COPYING.GPL $pkgdir/usr/share/licenses/$pkgname/COPYING.GPL
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 INSTALL.readme $pkgdir/usr/share/doc/$pkgname/INSTALL.readme
}
# vim:set ts=2 sw=2 et:
