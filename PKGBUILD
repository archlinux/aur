# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-configtool
pkgver=0.4.7
pkgrel=2
pkgdesc="GTK based config tool for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.7" "gtk3" "iso-codes")
optdepends=('fcitx-qt4: for some configuration windows')
makedepends=("cmake")
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

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

sha512sums=('90ec9f4c30c46ea937f965173a4213b67d1cb360cc43b96af9899cdd5a0e35d34658ee7149ed10b3dc58d3851bc1712915db970fd2d25a976983b1037e380be2')
