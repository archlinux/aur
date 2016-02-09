# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20160209_0.90
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/raw/release/source/deadbeef-fb_20160209_0.90_src.tar.gz')
md5sums=('da537597af97068b7bf88d763bb189f1')
sha1sums=('488f93cb700b9452652ca731beb32efbaec0c679')
sha256sums=('00abe047864160f04e9ba97e3c4dff40ef9684251cc10d619a9272cafdd8d8d0')

build() {
  cd ${srcdir}/deadbeef-fb-devel
  ./configure --prefix=/usr --disable-gtk3
  make
}

package() {
  cd ${srcdir}/deadbeef-fb-devel
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
