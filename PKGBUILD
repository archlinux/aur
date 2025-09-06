# Maintainer: envolution
# Contributor: wilke
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=harsh
pkgver=0.11.3
pkgrel=1
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

makedepends=('go>=1.14')

sha256sums=('863d2511438e1b9e407995a689cb877f69fcea71a93a88b2e1b9924930e84290')

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
