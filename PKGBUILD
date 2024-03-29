# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.1
pkgrel=1
pkgdesc="A GTK Frontend for GNOME Online Accounts"
arch=('x86_64')
url="https://github.com/linuxmint/gnome-online-accounts-gtk"
license=('GPL-3.0-or-later')
depends=('gnome-online-accounts')
makedepends=('meson')
#optdepends=('mint-translations: i18n')  ## translations not added yet
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47406ac9023d29c6fe6897abf9cdd2b8563647701502342d8c0e572027a24a17')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
