# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.5
pkgrel=1
pkgdesc="A GTK Frontend for GNOME Online Accounts"
arch=('x86_64')
url="https://github.com/xapp-project/gnome-online-accounts-gtk"
license=('GPL-3.0-or-later')
depends=('gnome-online-accounts')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('51e69133fb67dbdb98df2343e6311d19429b485ff4b9d8f195fb1d5dba77ac0e')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
