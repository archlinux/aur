# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/mediaelch

pkgname=mediaelch
pkgver=1.4
pkgrel=2
pkgdesc="a MediaManager for XBMC. Information about Movies, TV Shows and Concerts are stored as nfo files. Fanarts are downloaded automatically from fanart.tv"
arch=('x86_64' 'i686')
url="http://www.mediaelch.de/"
license=('GPL')
depends=('libmediainfo' 'phonon')
makedepends=()
_gitversion="ee7643272f74ac296cd74e84c9022910187064bf"
source=("https://github.com/Komet/MediaElch/archive/$_gitversion.tar.gz")
sha256sums=('1d7850bf4cbde3e0bc4efcfed8edbe272fc06ba6b33680899d17f1a4417dc7d4')

build() {
  cd "$srcdir/MediaElch-$_gitversion/"
  qmake && make
}

package() {
  cd "$srcdir/MediaElch-$_gitversion/"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
