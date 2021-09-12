# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>

pkgname=nq
pkgver=0.4
pkgrel=1
pkgdesc="Unix command line queue utility"
arch=('i686' 'x86_64')
url="https://github.com/leahneukirchen/nq"
license=('custom: Public domain')
depends=('glibc' 'sh')
checkdepends=('perl')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/leahneukirchen/nq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('287d6700063b64cfa9db51df95e2a046736eb38c0d3b6e0af0a8e7da6df8880b')


build() {
  cd "$pkgname-$pkgver"

  make
}

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/nq"
}
