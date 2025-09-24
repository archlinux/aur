# Maintainer: Chenx Dust <chenx_dust@outlook.com>

pkgname=fcitx5-steam-ibus-frontend
_owner=chenx-dust
pkgver=0.0.2
pkgrel=1
pkgdesc="Add fcitx5 support for Steam Big Picture session"
arch=('x86_64')
url="https://github.com/$_owner/$pkgname"
license=('GPL')
conflicts=('fcitx')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'pkgconf')
source=("git+https://github.com/$_owner/$pkgname.git#tag=v$pkgver")
sha512sums=('ab4eb2ac44a98433421a943e75ccb560b79fe517cf3d70fc74db677fea5014343d8a81ecc5f5e8aacc87f3f1aa2171d256a9f2a57dfbe21e9fd018d7a72cb37e')

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
