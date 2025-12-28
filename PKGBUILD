# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=slider-cli
pkgver=0.5.2
pkgrel=1
pkgdesc="Command-line implementation and Golang library for the RAMMB/CIRA SLIDER satellite image viewer"
arch=("x86_64")
_repo="SLIDER-cli"
url="https://github.com/colinmcintosh/SLIDER-cli"
license=("Apache-2.0")
depends=("glibc")
makedepends=("git" "go" "make")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d2680a2a9689fb73da4430987f2ebc859a550889c0c8dc11958911849d73ed38')

build() {
  cd "$srcdir/$_repo-$pkgver"

  make VERSION="$pkgver" build
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  install -Dm755 slider-cli "$pkgdir/usr/bin/slider-cli"
}
