# Maintainer: ikozyris <ikozyris1337@gmail.com>

pkgname=kri
pkgver=0.8.3
pkgrel=2
pkgdesc='Simple, compact & very fast text editor'
arch=('x86_64')
url="https://github.com/ikozyris/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b363108e330b9cff438ca9b1c4af6a48882efae4a86c9af3c9d3fbec450038e')
makedepends=('gcc' 'make')
depends=('gcc-libs' 'glibc' 'ncurses')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  "./$pkgname" -h
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "$pkgname" -t "$pkgdir/usr/bin"
#  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}