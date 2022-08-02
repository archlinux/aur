# Maintainer: ny-a <nyaarch64@gmail..com>

pkgname=ecspresso
pkgver=1.7.12
pkgrel=1
pkgdesc="Deployment tool for Amazon ECS"
arch=('x86_64')
url="https://github.com/kayac/ecspresso"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/kayac/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41d78a83994130e4cfd65b0d8384b4b42297e37b54d2439c896f380aac874f6b')

build() {
  cd "$pkgname-$pkgver"

  go build "./cmd/$pkgname"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
