# Maintainer: hengtseChou <hankthedev@gmail.com>
pkgname=lnk
pkgver=0.9.0
pkgrel=3
pkgdesc="🔗 Git-native dotfiles management that doesn't suck. "
arch=('x86_64' 'aarch64')
url="https://github.com/yarlson/lnk"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c4fd9ced7c86813683fbebd608bf7438ef5e805b00b27f748f764d9d0624270')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o lnk .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 lnk "$pkgdir/usr/bin/lnk"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
