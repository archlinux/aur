# Maintainer: Benjamin Frank <ben+aur@pipsfrank.de>

pkgname=muttvcardsearch
pkgver=1.7
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
sha256sums=('bd8cf5e51fa7237007dd12e8ac89e4ce6d66bb1be7c7d17f12c81fecb1caa6cf')
