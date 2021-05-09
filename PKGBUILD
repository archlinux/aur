# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=duplicut
pkgver=2.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Remove duplicates from MASSIVE wordlist, without sorting it (for dictionary-based password cracking)'
url='https://github.com/nil0x42/duplicut'
license=('GPL3')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d91a735ec6aa4e0d17d170ea49b2055337e6f3d3a82cdeb7abe147230817215')
sha512sums=('f9ec9c7e4604b99689da2279773de33b18cef02bb8b41f1160963909503696bc276ac53b6d81eaf068f7fdff52a541fdadac430d775c4f7c11dd1ed636fe628e')
b2sums=('60a957a7cd11de6b5c731f8eac5011dc2e29482be2a4f1a0497c31b274dc572ae294997e0e5a6fbbb621af1d70a8cb6411a2002e90a1efa460e70ee45e71359b')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -D -m755 "$pkgname-$pkgver/$pkgname" "$pkgdir"/usr/bin/$pkgname
}
