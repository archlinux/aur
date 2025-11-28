# Maintainer: envolution
# Contributor: wilke
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=harsh
pkgver=0.12.2
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('31497b249f2c7e32dcbc29b8ffd13748e7720a05bd48afdf15ab4c5fd917c60d')

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  go get ./...
  go build -o harsh .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
# vim:set ts=2 sw=2 et:
