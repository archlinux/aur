# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# Co-Maintainer: ikozyris <ikozyris1337@gmail.com>

# https://github.com/adamperkowski/PKGBUILDs

pkgname=kri
pkgver=0.8.1
pkgrel=2
pkgdesc='Simple, compact & very fast text editor'
arch=('x86_64')
url="https://github.com/ikozyris/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('94b6cd4e533bb28b7b0fd238311bf38ba183ea42dd70dbeb652caec0643fb88d')
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
