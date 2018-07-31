# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=in
pkgver=1.2
pkgrel=2
pkgdesc='Run a command in a given directory'
arch=('x86_64')
url='https://github.com/xyproto/in'
license=('MIT')
makedepends=('go')
source=("https://github.com/xyproto/in/releases/download/$pkgver/in-$pkgver.tar.gz")
sha256sums=('98f8cd8f55c492f4bc2af67cdab2aa6e1d12bb6d5c4b815ace7e7cd8e8164fd6')

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
