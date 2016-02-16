# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20160216_0.92
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/raw/release/source/deadbeef-fb_20160216_0.92_src.tar.gz')
md5sums=('08afebf92ebb3eda75d41445b44011cb')
sha1sums=('baa6db45248191bc301dc0716b98fe88294d1316')
sha256sums=('511d06201b5224751de173ef274228191d73fe149a06a790d8481d45e7a2d205')

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
