# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=doas-sudo-shim
pkgver=0.1.1
pkgrel=3
pkgdesc="A shim for the sudo command that utilizes doas"
arch=(any)
url="https://github.com/jirutka/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo)
depends=(awk doas sh)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/doas-sudo-shim/archive/v$pkgver.tar.gz")
sha256sums=('795762a05ecf016d5dc5f1392b447d324380320bc913826b9ccc10ed0cefe43d')

build() {
  cd $pkgname-$pkgver
  make man
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
