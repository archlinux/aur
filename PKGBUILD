# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: pressh <pressh@gmail.com>
# Contributor: Alessio Bolognino <themolok@gmail.com>

pkgname=gsopcast
pkgver=0.4.0
pkgrel=8
pkgdesc='GTK front-end of p2p TV sopcast'
arch=('x86_64')
url='https://code.google.com/archive/p/gsopcast/'
license=('GPL')
depends=('alsa-lib' 'gtk2' 'sopcast')
makedepends=('addinclude' 'perl-xml-parser' 'pkgconfig')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('65e4f09d714455df809a58c12a76749f')
sha256sums=('be90eee9e31ce4232511bc6555c8dde75ed813efa97a483bb6fa5c20c3ebb155')

prepare() {
  addinclude "$pkgname-$pkgver/src/header.h" string
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
