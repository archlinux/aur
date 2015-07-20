# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20150720
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150720')
md5sums=('8f37f126d5f50d27b866c92d1de24e15')
sha1sums=('23a24ed538d57400c2c3e9f192ddb3ab6dfd7525')
sha256sums=('0c5546349bafcab4f1f0b007fd0768150e0b9733b30c1d4d583ceb48dc121e46')

build() {
  cd $srcdir/deadbeef-fb.git
  ./autogen.sh
  ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd $srcdir/deadbeef-fb.git
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
