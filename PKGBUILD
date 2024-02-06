# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dr-Noob <peibolms at gmail dot com>

pkgname=cpufetch
pkgver=1.05
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/Dr-Noob/cpufetch"
license=(MIT)
depends=(glibc)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('82c8195cc535ad468fa2e61fa9648bb09d55cbcc59f76a72b66bd99fd290a7e6')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  sed -i 's/cpufetch-git/cpufetch/g' Makefile
}

build() {
  cd "$_archive"

  make GIT_VERSION="$pkgver"
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir/" install
}
