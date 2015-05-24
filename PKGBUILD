# Maintainer: Christopher Reimer <archlinux[at]creimer[dot]net>
pkgname=friidump
pkgver=0.5.3.1
pkgrel=1
pkgdesc="Lets you dump Nintendo Wii and GameCube discs"
arch=('i686' 'x86_64')
url="https://github.com/bradenmcd/friidump"
license=('GPL2')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/bradenmcd/$pkgname/archive/$pkgver.tar.gz")
md5sums=('c86b22f21e74b1f6f54e5d878bcdba71')

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  cd build
  make DESTDIR="$pkgdir" install
}
