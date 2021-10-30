# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=libb6
pkgver=r5.4e330d5
pkgrel=1
pkgdesc="Library for interfacing with SkyRC B6xx series chargers"
arch=('x86_64')
url="https://github.com/maciek134/libb6"
license=('GPL3')
depends=('libusb')
makedepends=('git' 'cmake')
source=("git+https://github.com/maciek134/libb6.git#commit=4e330d5")
sha256sums=('SKIP')

pkgver() {

  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

 cd "$srcdir/$pkgname"
 cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
 make

}

package() {

  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr"
  make prefix="$pkgdir/usr" install
  
}
