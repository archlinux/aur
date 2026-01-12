# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=0.2.1
pkgrel=1
pkgdesc="Understand File Permissions"
arch=('any')
url="https://github.com/ronniedroid/concessio"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5f71c013520c5e0dbbc2fbec2ccc59a520bc66c93b01bd729031ebce52dd5d9')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.ronniedroid.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
