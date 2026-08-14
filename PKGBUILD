# Maintainer: ikozyris <ikozyris1337@gmail.com>

pkgname=kri
pkgver=0.9
pkgrel=1
pkgdesc='Simple, compact & very fast text editor'
arch=('x86_64')
url="https://github.com/ikozyris/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4551ee0112eed9d07bc2d991cb14899368a743c80f69a6a07c996ea7d884e570')
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
  make install
#  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}