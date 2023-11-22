# Maintainer: Adrian Perez <adrian@perezdecastro.org>
pkgname=9pfuse
pkgver=2
pkgrel=1
pkgdesc="The 9p protocol implementation for FUSE from Plan9 Port"
arch=(x86_64 i686)
url="https://github.com/aperezdc/9pfuse"
license=('GPL')
depends=(fuse)
makedepends=(meson)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('3572fc0e40ba126e50ce79c2d80304ad05b79c6fa24fda0e5a17cd2301375a51')

build() {
  rm -rf _build
  arch-meson _build "$pkgname-$pkgver"
  meson compile -C_build
}

package() {
  meson install -C_build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
