# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=memstrack
pkgver=0.2
pkgrel=1
pkgdesc="A memory allocation trace, like a hot spot analyzer for memory allocation"
arch=('any')
url="https://github.com/ryncsn/memstrack"
license=('GPL3')
makedepends=('gcc' 'ncurses')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('59000c8aa56fb169ff93e7feb8f9fce91b62ddd49d4b319e1ebda6d4b6430698')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
}
