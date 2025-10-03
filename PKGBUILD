# Maintainer: Chenx Dust <chenx_dust@outlook.com>

pkgname=fcitx5-steam-ibus-frontend
_owner=chenx-dust
pkgver=0.0.4
pkgrel=1
pkgdesc="Add fcitx5 support for Steam Big Picture session"
arch=('x86_64')
url="https://github.com/$_owner/$pkgname"
license=('GPL')
conflicts=('fcitx')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'pkgconf')
source=("git+https://github.com/$_owner/$pkgname.git#tag=v$pkgver")
sha512sums=('8729645dfc5913d2bbfb67f641a2720f68b680e48f91e723dc89c444525aaa6fcfd8cb29a795d6c51ef03fdc1158623427f4562acd4b4bab9efdab9140a28bdb')

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
