# Maintainer: envolution
# Contributor: wilke
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=harsh
pkgver=0.10.12
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('cd5308201808b20ced1a48fedd837bcd199a238524b26265e88bac6b7bcad1b1')

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/archive/refs/tags/v$pkgver.tar.gz")

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
