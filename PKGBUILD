# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Claudio Sabattoli <gasherbrum3@alice.it>
# Contributor: Ole Ernst <olebowle@gmx.com>

pkgname=idesk
pkgver=0.7.9
pkgrel=10
pkgdesc="IDesk gives users icons on their desktop. Features include transparency, configurable actions to run shell commands, PNG, SVG and GIF image support, and XFT anti-aliased fonts"
arch=('x86_64' 'i686')
url="https://github.com/neagix/idesk/"
license=('GPL')
depends=('pkgconfig' 'imlib2' 'libpng' 'libxpm' 'libxft' 'gcc-libs' 'librsvg')
source=("https://github.com/neagix/idesk/archive/v0.7.9.zip")
sha256sums=('fb20428a35c58a655d6183768d57f475e8569e843c472fdd651c3e43f0592b62')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-svg
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
