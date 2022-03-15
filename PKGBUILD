# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>

pkgname=wapanel
pkgver=1.1.0
pkgrel=2
pkgdesc="Wayland panel and taskbar"
arch=('x86_64')
url="https://github.com/Firstbober/wapanel"
license=('MIT')
depends=('gtk-layer-shell' 'gtk3' 'wayland-protocols' 'libpulse' 'xdg-utils')
makedepends=('meson' 'toml11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4f2f11f0d001b4507b5b1dc6622df68a9e786f590cabf603bc5a3b296039f0a5')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
