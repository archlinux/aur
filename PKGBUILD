# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-configtool
pkgver=0.4.9
pkgrel=1
pkgdesc="GTK based config tool for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.7" "gtk3" "iso-codes")
optdepends=('fcitx-qt4: for some configuration windows'
            'fcitx-qt5: for some other configuration windows')
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

sha512sums=('800c731b370ace833179560260df7ffc9c0235c4f3257e8a99a0194f2fd06b71f738e6c77985871c3368179f944da2165dac5d4a8f7ba083519cb2509a9eb62b')
