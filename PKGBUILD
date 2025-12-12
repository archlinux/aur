# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-online-accounts-gtk
pkgver=3.50.9
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
sha256sums=('ca5bed588d26d42dac04d80640006e1cb0807f0b453002fe4755ed9ada59b3a9')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
