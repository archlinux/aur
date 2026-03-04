# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=0.3.0
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
sha256sums=('a1497b406f8c864568b998a425aafb08ed506cd6508ed935225acadf272ac4dc')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.ronniedroid.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
