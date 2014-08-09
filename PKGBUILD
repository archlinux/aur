# Maintainer: Benjamin Frank <ben+aur@pipsfrank.de>

pkgname=muttvcardsearch
pkgver=1.9
pkgrel=1
pkgdesc="A small mutt carddav search utility."
arch=('i686' 'x86_64')
url="https://github.com/tfl/muttvcardsearch"
license=('GPL')
depends=('curl' 'sqlite3')
makedepends=('cmake')
provides=(muttvcardsearch)
source=("https://github.com/tfl/muttvcardsearch/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 manual/muttvcardsearch.man ${pkgdir}/usr/share/man/man8/muttvcardsearch.8
}
sha256sums=('4c099938dd02f577d8289bbc5e82f0af6f290a564a30f6fdcb5cc880cd02fc8d')
