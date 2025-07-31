# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.7
pkgrel=1
pkgdesc="A GTK Frontend for GNOME Online Accounts"
arch=('x86_64')
url="https://github.com/xapp-project/gnome-online-accounts-gtk"
license=('GPL-3.0-or-later')
depends=('gnome-online-accounts')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e8d38dbcafa27d089776cf262bbbd9fbb648d99c777f6ba77ce963644fb2e01')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
