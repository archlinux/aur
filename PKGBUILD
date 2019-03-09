# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgname=nuspell
pkgver=2.1.0
pkgrel=1
pkgdesc='Free and open source C++ spell checking library'
arch=('x86_64')
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('boost-libs' 'icu')
makedepends=('boost')
source=("https://github.com/nuspell/nuspell/archive/v${pkgver}.tar.gz")
md5sums=('b8157741a68d8de80ac02589f708fe92')

prepare() {
  cd nuspell-$pkgver
  autoreconf -vfi
}

build() {
  cd nuspell-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd nuspell-$pkgver
  make DESTDIR="$pkgdir" install
}
