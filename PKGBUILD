# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.1
pkgrel=1
pkgdesc='Run a command in a given directory'
arch=('x86_64')
url='https://github.com/xyproto/in'
license=('MIT')
makedepends=('go')
source=("https://github.com/xyproto/in/releases/download/$pkgver/in-$pkgver.tar.gz")
sha256sums=('b9bea33a0fee3c7c02a6cf0ca0acdd46a42194cbf4d72a3850d1b004f8799d9f')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags='-s -w'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
