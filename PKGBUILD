# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20150727
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150727')
md5sums=('b245e8f91b2194f5b231b87f8f6d9d7e')
sha1sums=('48fe994ffcc860023d04cc75bde8def1ed2e9e29')
sha256sums=('f6b6385c5da32ae51dddc4836219fe67bd00f2d5eaa3afa226fc08c1af908421')

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
