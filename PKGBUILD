# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dr-Noob <peibolms at gmail dot com>

pkgname=cpufetch
pkgver=1.06
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/Dr-Noob/cpufetch"
license=(MIT)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b8ec1339cf3a3bb9325cde7fb0748dd609043e8d2938c292956da7e457bdb7d9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/cpufetch-git/cpufetch/g' Makefile
}

build() {
  cd $pkgname-$pkgver
  make GIT_VERSION="$pkgver"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
