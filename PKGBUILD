# Author: Jan D. Behrens <zykure@web.de>
# Contributor: doctorkohaku <maido.in.heaven@gmail.com>
# Contributor: Alad Wenter <the.changing.side@gmail.com>
# Maintainer: Jan D. Behrens <zykure@web.de>

pkgname=deadbeef-plugin-fb
pkgver=20160212_0.91
pkgrel=1
pkgdesc="A filebrowser plugin for the DeaDBeeF audio player"
arch=('any')
url="https://gitlab.com/zykure/deadbeef-fb"
license=(GPL)
depends=('deadbeef>=0.6', gtk2)
backup=()
source=('https://gitlab.com/zykure/deadbeef-fb/raw/release/source/deadbeef-fb_20160212_0.91_src.tar.gz')
md5sums=('e5569f7731b6f5fb2e95235a2e5abd8c')
sha1sums=('2354e27dde15fdebc2093f4b256d9b30a05499c6')
sha256sums=('ee2b9735c49e4f0d30783d2e87e5785c806344cfc5103920ac047149baac3349')

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
