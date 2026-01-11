# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=0.2.0
pkgrel=1
pkgdesc="Understand File Permissions"
arch=('any')
url="https://github.com/ronniedroid/concessio"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aec0e92ee4dab3de1124a4cda97ddc5bbbdfa7ca0ea5abb41f7e46aadf44fe83')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.ronniedroid.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
