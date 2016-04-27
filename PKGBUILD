# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.7
pkgrel=2
pkgdesc='Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz"{,.sig})
sha512sums=('628eb7d2b09a3383ab92460dc8c2bc86771482cc84bdce847a394ee595423642dff29a39ccf31f56ea8de833f25e9d42952b55b754dd234d0831b5de5431d16a'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd $pkgname-$pkgver
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
