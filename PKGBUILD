# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.6
pkgrel=1
pkgdesc='Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL')
depends=('fcitx')
makedepends=('cmake' 'intltool')
install=fcitx-table-extra.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

build() {
  cd $pkgname-$pkgver
 
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

sha512sums=('3970fd9fb14afef5bc55fcfb8234c12951cf88a8ead9be1575ba3100d08f83f23c923093722380ca9c066d6a3fa065bd51f176b09815b0c85f13d8351a004304')
