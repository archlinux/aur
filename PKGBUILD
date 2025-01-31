# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ttf-adwaita-fonts
pkgver=48.2
pkgrel=2
pkgdesc="The typefaces for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/adwaita-fonts"
license=('GPL-3.0-or-later AND OFL-1.1')
makedepends=('meson')
source=("https://download.gnome.org/sources/adwaita-fonts/${pkgver//.*}/adwaita-fonts-$pkgver.tar.xz")
sha256sums=('156f7e92f2f82e527fc73c309dbb237c0a4a5c3a95bc5ee94a5efb6947c553e0')

build() {
  cd "adwaita-fonts-$pkgver"
  meson setup build
}

package() {
  cd "adwaita-fonts-$pkgver"
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
