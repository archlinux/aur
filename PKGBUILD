#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=kvkbd
_reponame=kvkbd5
pkgver=0.8.0
pkgrel=1
pkgdesc="A virtual keyboard for KDE"
arch=(x86_64)
url="https://github.com/ctrlcctrlv/kvkbd5"
license=(GPL)
depends=(qt5-base qt5-x11extras)
makedepends=(cmake docbook-xsl)
source=("$url/archive/refs/tags/v$pkgver.zip")
b2sums=('47b929f4c04a96e3b8c539e29fdbd07e1bebfe4bac20e3863d366b4ef74871d29ddd8a12d0336acf755b7fd96c4ff62e8473ca9d7d625aaaa5e1114903029e7c')

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
