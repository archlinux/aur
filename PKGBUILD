# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=adwsteamgtk
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('cantarell-fonts' 'libadwaita' 'python-gobject' 'python-packaging' 'steam')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('gnome-shell-extension-rounded-window-corners: Rounded corners on GNOME')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a30bcb41bd8fe8f7fb5c526b72dfecb7150763fde596582d087328b730517fb')

build() {
  arch-meson "AdwSteamGtk-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
