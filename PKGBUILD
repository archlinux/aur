# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20150930
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=20150930')
md5sums=('726d382a81a8b3ea6e7bd511beb46ecd')
sha1sums=('74ac9d38bd1d4b386fc236059ea479cc5927f292')
sha256sums=('ff97d1e9360b5d4fa535f88df87710da8dcb100b33ebb09c4dda031aa01ff9a7')

build() {
  cd $srcdir/deadbeef-fb-20150930-*
  ./autogen.sh
  ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd $srcdir/deadbeef-fb-20150930-*
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
