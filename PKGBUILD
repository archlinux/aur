# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=1.5.2
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('flac')
makedepends=('asciidoc')
license=('ISC')
source=("$url"/archive/"$pkgver".tar.gz)
sha512sums=('b80911a35a4b06ffebdb96f8b419ea69bf33af826c30e4054638de96a3513904f5df5c05d908b7f3f7972bc9c541975f10ab22dbad20ad72c3fd379506f533a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
