# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.8
pkgrel=2
pkgdesc='Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
arch=('any')
url="https://github.com/fcitx/fcitx-table-extra"
license=('GPL')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz"{,.sig})
sha512sums=('454798e9bd25c630ce98e2daf7296e82ba5fbc98027171038a5a7b9ac3169c153302a6703d9416718ec3a0b76db6d732caf3f03c6e6005841c9d7798702542df'
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
