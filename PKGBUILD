# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20151103
pkgrel=0.86
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/raw/release/source/deadbeef-fb_20151103_src.tar.gz')
md5sums=('61a06fc556ae61d2ce297bb975a8615a')
sha1sums=('771c0d12ae4acd458f72ab22f434e73c23f12101')
sha256sums=('b84a35f611ccb14693f30280bd08df7bc8ce2c6b88198f3b0083385c5dedc243')

build() {
  cd ${srcdir}/deadbeef-fb-devel
  ./configure --prefix=/usr --disable-gtk2
  make
}

package() {
  cd ${srcdir}/deadbeef-fb-devel
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
