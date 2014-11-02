# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf
pkgver=0.2.1
pkgrel=2
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('MIT')
depends=('gcc-libs' 'expat' 'icu')
source=("https://easy-rpg.org/downloads/player/liblcf-$pkgver.tar.gz")
sha256sums=('1074f9f8738d9fecc318e3f79008ded8a060f94379888802276d6e51941b7be9')

build () {
  cd liblcf-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  make -C liblcf-$pkgver check
}

package () {
  cd liblcf-$pkgver

  make DESTDIR="$pkgdir/" install
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
