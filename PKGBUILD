# Maintainer: Cristian Burneci <cburneci at gmail dot com>

pkgname=tv-lite
pkgver=0.3.1
pkgrel=1
pkgdesc="IPTV viewer with Sopcast and Acestream handling capabilities.  It wants to be a replacement for the older TV-Maxe"
arch=('any')
url="http://www.tv-lite.com"
license=('GPL2')
groups=()
depends=('vlc' 'wxgtk3' 'sqlite' 'curl' 'util-linux-libs')
makedepends=('rapidjson' 'cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/cburneci/tv-lite/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)

noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  mkdir -p build
  cd build
  cmake -DWX_CONFIG=wx-config-gtk3 ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src/build"

  make DESTDIR="$pkgdir/" install
}
