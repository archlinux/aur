# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=1.3
pkgrel=1
pkgdesc="a MediaManager for XBMC. Information about Movies, TV Shows and Concerts are stored as nfo files. Fanarts are downloaded automatically from fanart.tv"
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('qt' 'libmediainfo')
makedepends=()
_gitversion="e25888e64db04dc65ef1a42681e7182729035f8a"
source=("https://github.com/Komet/MediaElch/archive/$_gitversion.tar.gz")
sha256sums=('39667be53c5bfecbe62688fc1e816ca2a5f275ae7a1b94f07f2e99932e2c34ef')

build() {
  cd "$srcdir/MediaElch-$_gitversion/"
  qmake && make
}

package() {
  cd "$srcdir/MediaElch-$_gitversion/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
