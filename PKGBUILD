# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=memstrack
pkgver=0.2.2
pkgrel=1
pkgdesc="A memory allocation trace, like a hot spot analyzer for memory allocation"
arch=('any')
url="https://github.com/ryncsn/memstrack"
license=('GPL3')
makedepends=('gcc' 'ncurses')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('93544fb2a9be533bbb7aec28afb4227f1156c38f3cd7576e5afa329ea103d3f5')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
}
