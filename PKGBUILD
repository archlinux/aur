# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb-gtk3
pkgver=20160128_0.89
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk3)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/raw/release/source/deadbeef-fb_20160128_0.89_src.tar.gz')
md5sums=('e52b7b3cfb6752f5384abf99f13f3eeb')
sha1sums=('2899ab4e666e18c48d1b1ae4834d7b15fcd8e562')
sha256sums=('cca49f937f625a4965f2726d0f607b09240c5479d89b6e495011dc2ec16e036f')

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
