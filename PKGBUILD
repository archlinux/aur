# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20150721
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150721')
md5sums=('8b011c81aa0c04ce153b1aad5f8bc9ba')
sha1sums=('a7f958c319d45f91eaac4710b5fb68cf9e3a650a')
sha256sums=('3c2de2748f991118da5b3fcbb5dd1f196f223932d3176cf9ace438f149c9f3a5')

build() {
  cd $srcdir/deadbeef-fb.git
  ./autogen.sh
  ./configure --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $srcdir/deadbeef-fb.git
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
