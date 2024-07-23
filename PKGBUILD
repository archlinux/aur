# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>

pkgname=nq
pkgver=1.0
pkgrel=1
pkgdesc="Unix command line queue utility"
arch=('i686' 'x86_64')
url="https://github.com/leahneukirchen/nq"
license=('CC0-1.0')
depends=('glibc' 'sh')
checkdepends=('perl')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/leahneukirchen/nq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5b79a488a88f4e4d04184efa0bc116929baf9b34617af70d8debfb37f7431f4')


build() {
  cd "$pkgname-$pkgver"

  make
}

check() {
  cd "$pkgname-$pkgver"

  #make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/nq"
  install -Dm644 {NEWS,README}.md -t "$pkgdir/usr/share/doc/nq"
}
