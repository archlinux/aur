#!/usr/bin/env bash
# Maintainer: Joshua Hoeflich
pkgname=lsr-git
__repo_name__=lsr
pkgver=main
pkgrel=1
pkgdesc="Recursively list files in directories."
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
source=("https://github.com/joshuahoeflich/${__repo_name__}/archive/main.tar.gz")
noextract=()
md5sums=('da8293111d8ae975b31bceeab71e89d5')

build() {
  cd "${__repo_name__}-$pkgver"
  cargo build --release
}

package() {
  cd "${__repo_name__}-$pkgver"
  mkdir -p "$pkgdir"/usr/bin
  cp target/release/lsr "$pkgdir"/usr/bin
}
