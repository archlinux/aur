#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=kvkbd
_reponame=kvkbd5
pkgver=0.8.1
pkgrel=1
pkgdesc="A virtual keyboard for KDE"
arch=(x86_64)
url="https://github.com/ctrlcctrlv/kvkbd5"
license=(GPL)
depends=(qt5-base qt5-x11extras)
makedepends=(cmake docbook-xsl)
source=("$url/archive/refs/tags/v$pkgver.zip")
b2sums=('3730f4b30a9bc9211ae66b5de86008d23f3f175a5560b7459fdaf28c99cc61b030e65c126c6291a2b46bf1c038362b82b97be6073a6a09c4e1bb0ff59248bf34')

prepare() {
  cd "$_reponame-$pkgver"
  #cd ../../../build
  cmake -B build \
	-DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "$_reponame-$pkgver/build"
  #cd ../../../build
  make all
}

package() {
  cd "$_reponame-$pkgver/build"
  #cd ../../../build
  make DESTDIR="$pkgdir" install
}
