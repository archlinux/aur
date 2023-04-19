#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=kvkbd
_reponame=kvkbd5
pkgver=0.8.0
pkgrel=2
pkgdesc="A virtual keyboard for KDE"
arch=(x86_64)
url="https://github.com/ctrlcctrlv/kvkbd5"
license=(GPL)
depends=(qt5-base qt5-x11extras)
makedepends=(cmake docbook-xsl)
source=("$url/archive/refs/tags/v$pkgver.zip")
b2sums=('9765461763c63d0d68b2d2102de8388421cc54944eec7894c7ac57282bd4baf1d7a7615bfd362be32b166df08dbd1b30f6683fe3099665bfda46e86a80294a3c')

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
