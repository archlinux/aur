# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-table-other
pkgver=0.2.4
pkgrel=2
pkgdesc='Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables.'
arch=('any')
url="https://github.com/fcitx/fcitx-table-other"
license=('GPL2')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('f7eeb45acfd31f5292b2fa0b068b755fddc30d42d23967ad684a5f665b76de8e98b56219cecd6bacaa5f8ec8af7453ed5c3a4b9f15d312f5b32f8e49ab30688d')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
