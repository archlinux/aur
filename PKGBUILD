# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# Co-Maintainer: ikozyris <ikozyris1337@gmail.com>

# https://github.com/adamperkowski/PKGBUILDs

pkgname=kri
pkgver=0.8.3
pkgrel=1
pkgdesc='Simple, compact & very fast text editor'
arch=('x86_64')
url="https://github.com/ikozyris/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1a35c33c44be9c7063c040928f8c32d6d4eac2023de7560a207dbb3dce6e57fd')
makedepends=('gcc' 'make')
depends=('gcc-libs' 'glibc' 'ncurses')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  "./$pkgname" -h
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
