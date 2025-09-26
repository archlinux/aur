# Maintainer: Chenx Dust <chenx_dust@outlook.com>

pkgname=fcitx5-steam-ibus-frontend
_owner=chenx-dust
pkgver=0.0.3
pkgrel=1
pkgdesc="Add fcitx5 support for Steam Big Picture session"
arch=('x86_64')
url="https://github.com/$_owner/$pkgname"
license=('GPL')
conflicts=('fcitx')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'pkgconf')
source=("git+https://github.com/$_owner/$pkgname.git#tag=v$pkgver")
sha512sums=('23265ef95614442c28abe8fcba675d0ae068f37ce63455901767a3c403fa228f6b92cd1dde725a8b074608aa7e32be44ec0c5a44910c9d1ebbeb91d863b11cb5')

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
