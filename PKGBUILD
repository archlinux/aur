# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=d-stdx-allocator
_pkgname=stdx-allocator
pkgver=2.77.3
pkgrel=2
pkgdesc='Extracted std.experimental.allocator'
arch=('x86_64')
url='https://github.com/dlang-community/stdx-allocator'
license=('Boost')
depends=('liblphobos')
makedepends=('meson' 'ldc' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cf558f19bffe555c4f022ab2090b9ad46086eb1dfe7be02cd9fa7451d1b857a6')

build() {
  mkdir $_pkgname-$pkgver/build
  cd $_pkgname-$pkgver/build

  export DC=ldc

  arch-meson

  ninja
}

check() {
  cd $_pkgname-$pkgver/build

  meson test
}

package() {
  cd $_pkgname-$pkgver/build

  DESTDIR="$pkgdir" ninja install
}

