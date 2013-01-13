# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-configtool
pkgver=0.4.5.2
pkgrel=1
pkgdesc="GTK based config tool for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.6" "gtk3" "iso-codes")
makedepends=("cmake")
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  msg "Starting make..."

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

md5sums=('fc5d232ed2e7b7b3fced0264961f48d9')
