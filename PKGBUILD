# Maintainer: Posi <posi1981@gmail.com>

# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=clex
pkgver=4.7
pkgrel=1
pkgdesc="File manager with a full-screen user interface"
arch=('i686' 'x86_64')
url="https://github.com/xitop/clex"
license=('GPL2')
depends=('ncurses')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('dd8ddac89132f691cb4d449e5d879e91355da29c0a2d9f2f55c55aacb2059e93')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
