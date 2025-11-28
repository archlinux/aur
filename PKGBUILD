# Maintainer: envolution
# Contributor: wilke
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=harsh
pkgver=0.12.1
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('dc2242cd816e367698825956d15503ee54f8e785c52b7af49725fb548864fbd4')

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
