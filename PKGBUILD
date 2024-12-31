# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>
# shellcheck disable=SC2001,SC2034,SC2154 shell=bash

pkgname=espeak-ng-mbrola
pkgver=1.52.0
pkgrel=1
pkgdesc='Connection layer between Espeak-NG and Mbrola'
url=https://github.com/espeak-ng/espeak-ng
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  espeak-ng
  mbrola
)
checkdepends=()
makedepends=()
optdepends=(
  mbrola-voices-en1
  mbrola-voices-jp3
  mbrola-voices-us1
  mbrola-voices-us2
  mbrola-voices-us3
)
replaces=()
provides=()
conflicts=(
  "$pkgname"-git
)
source=("git+$url.git#tag=$pkgver")
b2sums=('f934eb948035222de2c6b5c7d8c9e104e0326ceb1052859598ed6f0010fd975bc3e1ef26ac60f77c3b6d1a4aa567b4b7d3c75639dca89eef2508be2a680f7c2b')

package() {
  cd espeak-ng
  destdir="$pkgdir"/usr/share/espeak-ng-data/voices/mb
  install -d "$destdir"
  install -Dm644 espeak-ng-data/voices/mb/* "$destdir"
}

# vim:set ts=2 sw=2 et:
