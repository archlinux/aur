# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-configtool
pkgver=0.4.8
pkgrel=1
pkgdesc="GTK based config tool for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.7" "gtk3" "iso-codes")
optdepends=('fcitx-qt4: for some configuration windows')
makedepends=("cmake")
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd $pkgname-$pkgver
  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha512sums=('7b3c43b9d7d1dab04880effe6fc4e80e64c9bad34699c0c8d2992ec971605ef2eaa0b1fb13f71a582289c75560c3edc95af21f6413ac2bb594d5cdb31a0b4cb7')
