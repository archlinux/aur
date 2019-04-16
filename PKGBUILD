# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=ibus-libzhuyin
pkgver=1.9.0
pkgrel=1
pkgdesc="New Zhuyin engine based on libzhuyin for IBus"
arch=('x86_64')
license=('GPL2')
url="https://github.com/libzhuyin/ibus-libzhuyin"
depends=('ibus' 'opencc' 'python-xdg')
makedepends=('git' 'intltool' 'gnome-common')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libzhuyin/ibus-libzhuyin/archive/$pkgver.tar.gz")
sha512sums=('6ad2d4768e0f5d605b66dd5133b55940972a9f92c8257f09b53a84cf80a07eabb9f2f9c354de66d4544321f0bdbb763b7401d28d468934b12a20fdbc7dd75b55')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --enable-opencc
  make
}

package() {
  cd $pkgname-$pkgver
  make NO_INDEX=true DESTDIR="$pkgdir" install
}
