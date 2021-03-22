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
md5sums=('b7a9e4a0e5ae141868b195e5fc916381')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/bin
  cp target/release/lsr "$pkgdir"/usr/bin
}
