# Contributor: Konstantin Mochalov <incredible.angst@gmail.com>
# Maintainer: FredBezies <fredbezies@gmail.com>
# Maintainer: Sean Bartell <archlinux@yotann.org>

pkgname="ncsa-mosaic-git"
epoch=1
pkgver=2.7b6.r25.gaf942b9
_pkgver=2.7b6
pkgrel=1
pkgdesc="One of the first graphical web browsers"
url="http://github.com/yotann/ncsa-mosaic"
license=(custom)
arch=(i686 x86_64)
depends=(lesstif libjpeg libpng libxmu libxpm)
makedepends=("git")
source=("git://github.com/yotann/ncsa-mosaic")
md5sums=(SKIP)
options=(!makeflags)

pkgver() {
  cd ncsa-mosaic
  echo $_pkgver.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
  cd ncsa-mosaic
  make linux
}

package() {
  cd ncsa-mosaic
  install -Dm0755 "src/Mosaic"              "$pkgdir/usr/bin/Mosaic"
  install -Dm0644 "COPYRIGHT"               "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 "desktop/Mosaic.png"      "$pkgdir/usr/share/icons/Mosaic.png"
  install -Dm0644 "desktop/Mosaic.desktop"  "$pkgdir/usr/share/applications/Mosaic.desktop"
}
