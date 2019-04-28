# Maintainer: Axel Hinrichs <hinrichs@bitscape.de>

pkgname=catatonit
pkgver=0.1.4
pkgrel=1
pkgdesc="A container init that is so simple it's effectively brain-dead."
arch=('x86_64')
url="http://github.com/openSUSE/catatonit/"
license=('GPL3')

source=("https://github.com/openSUSE/catatonit/releases/download/v$pkgver/$pkgname.tar.xz")
sha256sums=('5b6dab80839b4246484ca861764899cbc21eecaff4740d2cb6a0463bc70bf63b')

build() {
  cd "$pkgname-$pkgver"

  autoreconf -fi
  ./configure --prefix=/usr
  make
  strip $pkgname
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh
