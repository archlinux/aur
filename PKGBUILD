# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=libpurple-lurch
pkgver=0.7.0
pkgrel=2
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('x86_64')
url='https://github.com/gkdr/lurch'
license=('GPL3')
depends=('libomemo.so' 'libaxc.so' 'libsignal-protocol-c')
makedepends=('libpurple')
optdepends=('libpurple-carbons: message carbons support')
source=("https://github.com/gkdr/lurch/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('1a3cc1dbfd8f999b677b23d02952a3c28c922d438cfe81a3bfd3a03cc49723fcc4d52a549bfc7ecb45616a0c939b0f78a39f73a4439bc5337d4da656e9d42b11')

build() {
  cd ${pkgname##libpurple-}-${pkgver}
  make
}

package() {
  cd ${pkgname##libpurple-}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
