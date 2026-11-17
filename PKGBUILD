# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxirc
pkgver=1.50.0
pkgrel=1
pkgdesc="A simple IRC client"
arch=('i686' 'x86_64')
url="https://dxirc.org"
license=("GPL")
depends=('fox' 'lua' 'qt6-base' 'qt6-multimedia' 'openssl')
makedepends=('cmake' 'ninja')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('09d19789bd065971b6a6154df00ff9ef')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
