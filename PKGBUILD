# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>

pkgname=ibus-libzhuyin
pkgver=1.8.93
pkgrel=1
pkgdesc="New Zhuyin engine based on libzhuyin for IBus"
arch=('x86_64')
license=('GPL2')
url="https://github.com/libzhuyin/ibus-libzhuyin"
depends=('ibus' 'opencc' 'python-xdg')
makedepends=('git' 'intltool' 'gnome-common')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libzhuyin/ibus-libzhuyin/archive/$pkgver.tar.gz")
sha512sums=('2eddbb9227a303fb33ad6d5ade1eba38a8dc87bcf305fe13f11a16b4256c4952c71e24bd182d333eff1b9d2bd6b0bd320e7c8898de0ffd7c40baaf33c6cd11c4')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --enable-opencc
  make
}

package() {
  cd $pkgname-$pkgver
  make NO_INDEX=true DESTDIR="$pkgdir" install
}
