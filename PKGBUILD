# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-silver-gtk
pkgver=6.7.4
pkgrel=1
pkgdesc='Silver widget theme for GTK 2 and 3'
arch=(any)
url='https://github.com/Sonic-DE/sonic-silver-gtk'
license=(LGPL-2.0-or-later)
depends=()
makedepends=(python-cairo
             sassc
             sonic-frameworks-cmake-modules
             sonic-silver)
provides=(breeze-gtk)
conflicts=(breeze-gtk)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6915b3aaaa1e9eaf9dbc9117d21b938ccf955ba1352b3f220f8e19fd8f20f12b')

build(){
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
