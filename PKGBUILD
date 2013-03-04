# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=1.5
pkgrel=1
pkgdesc="a MediaManager for XBMC. Information about Movies, TV Shows and Concerts are stored as nfo files. Fanarts are downloaded automatically from fanart.tv"
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'phonon')
makedepends=()
_gitversion="bd0b8b7e64addc0de948c85c6bea32e161929f81"
source=("https://github.com/Komet/MediaElch/archive/$_gitversion.tar.gz")
sha256sums=('908f54a589a9df17840ee67bb200f55b34e59c052caaa207e722bb011741bda5')

build() {
  cd "$srcdir/MediaElch-$_gitversion/"
  qmake-qt4 && make
}

package() {
  cd "$srcdir/MediaElch-$_gitversion/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
