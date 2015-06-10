# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tiled-java
pkgver=0.7.2
pkgrel=1
pkgdesc='General purpose tile map editor'
arch=('x86_64' 'i686')
url="http://mapeditor.org/"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=("http://sourceforge.net/projects/tiled/files/Tiled/0.7.2/tiled-$pkgver-src.zip"
        "$pkgname.sh")
sha256sums=('15a2ee9557395f47a423b69305ad962b4b07bb678c0b7b13e686b31331c4c802'
            'c6ce26823e75036392113f896249fafbca2b4229659914da2097ec40d7b49053')

build() {
  cd "tiled-$pkgver"
  ant
}

package() {
  cd "tiled-$pkgver"
  mkdir -p "$pkgdir/usr/share"
  cp -rf dist/ "$pkgdir/usr/share/tiled/"
  install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
