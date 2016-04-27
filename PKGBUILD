# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx-table-other
pkgver=0.2.3
pkgrel=2
pkgdesc='Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables.'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx')
makedepends=('cmake' 'intltool')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('bd1eff0d4bd616a142711b0a7f9373ce9fdb6e99ded5cf717831aee475c8a442287e26355a2dd72ea39397603a42a6218b4233458028f0dccf4285d0e16fdf68')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
