# Maintainer: hengtseChou <hankthedev@gmail.com>
pkgname=lnk
pkgver=0.7.0
pkgrel=1
pkgdesc="🔗 Git-native dotfiles management that doesn't suck. "
arch=('x86_64' 'aarch64')
url="https://github.com/yarlson/lnk"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aeb60a34139af39fe9a495cf15b261e2c743dd757599737a1db36dd1ae997b96')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o lnk .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 lnk "$pkgdir/usr/bin/lnk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
