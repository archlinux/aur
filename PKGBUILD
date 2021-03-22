#!/usr/bin/env bash
# Maintainer: Joshua Hoeflich
pkgname=lsr-git
pkgver=main
pkgrel=1
pkgdesc="List files recursively."
arch=('x86_64')
url="https://github.com/joshuahoeflich/lsr"
license=('MIT')
groups=()
depends=()
makedepends=('cargo')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/joshuahoeflich/lsr/archive/main.tar.gz")
noextract=()
md5sums=('da8293111d8ae975b31bceeab71e89d5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/bin
  cp target/release/lsr "$pkgdir"/usr/bin
}
