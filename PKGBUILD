# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-configtool
pkgver=0.4.6
pkgrel=1
pkgdesc="GTK based config tool for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.7" "gtk3" "iso-codes")
optdepends=('fcitx-qt: for some configuration windows')
makedepends=("cmake")
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  msg "Starting make..."

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

md5sums=('69eb7271883b0b7894ddab5a38ceeb2f')
