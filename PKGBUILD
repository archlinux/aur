# Maintainer: hengtseChou <hankthedev@gmail.com>
pkgname=lnk
pkgver=0.9.0
pkgrel=2
pkgdesc="🔗 Git-native dotfiles management that doesn't suck. "
arch=('x86_64' 'aarch64')
url="https://github.com/yarlson/lnk"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f83e2895abf48211b9dffe85fede359d3c8968ee087c3673ef70399979ad3f3a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o lnk .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 lnk "$pkgdir/usr/bin/lnk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
