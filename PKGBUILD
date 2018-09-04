# Maintainer: Onkar Shinde <onkarshinde at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=gnusim8085
pkgver=1.4.1
pkgrel=1
pkgdesc="graphical simulator, assembler and debugger for the Intel 8085 microprocessor"
arch=('i686' 'x86_64')
url="http://gnusim8085.org/"
license=('GPL')
depends=('gtksourceview3>=3.10.0')
makedepends=('discount')
source=("https://github.com/GNUSim8085/GNUSim8085/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4af0797afa90490a2d236c4bb2053e30676cd14a9c9a4b4e1eeba9c9808ea017')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
