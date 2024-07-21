# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.4
pkgrel=1
pkgdesc="A GTK Frontend for GNOME Online Accounts"
arch=('x86_64')
url="https://github.com/xapp-project/gnome-online-accounts-gtk"
license=('GPL-3.0-or-later')
depends=('gnome-online-accounts')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('661192f5092cf722fb883d364f1f3555a4f2c00194e5c27f92e2ac0db65f1e93')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
