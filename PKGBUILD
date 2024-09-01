# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=0.1.4
pkgrel=1
pkgdesc="Understand File Permissions"
arch=('any')
url="https://github.com/ronniedroid/concessio"
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f42de210ac35635c6b2959ebe6b79ca173675d0246171517bbc9343cbdaf2fe0')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.ronniedroid.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
