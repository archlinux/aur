# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.10
pkgrel=1
pkgdesc="A GTK Frontend for GNOME Online Accounts"
arch=('x86_64')
url="https://github.com/xapp-project/gnome-online-accounts-gtk"
license=('GPL-3.0-or-later')
groups=('x-apps')
depends=(
  'gnome-online-accounts'
  'gtk4'
  'libadwaita'
  'libgoa'
  'xapp-symbolic-icons'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1335240713781c7f88d3d0a179cd275d309fd010cbd9d9048518560a75d774ac')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
