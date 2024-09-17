# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=concessio
pkgver=0.1.5
pkgrel=1
pkgdesc="Understand File Permissions"
arch=('any')
url="https://github.com/ronniedroid/concessio"
license=('GPL-3.0-or-later')
depends=('gjs' 'libadwaita')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa8708e23e32123a5ff26675246de940745da4cbdf65e40bc546bc96c3401f5f')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.ronniedroid.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
