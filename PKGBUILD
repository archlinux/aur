# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20150723
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150723')
md5sums=('abb080332975a419f53521a1edf08847')
sha1sums=('2f2b9c885fd009ae224f0b2df21982e5bb0f08bf')
sha256sums=('fad35ab2777b58a942eb95c01c150068f9caacda64b04a198cb3ddc67b7a2d78')

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
