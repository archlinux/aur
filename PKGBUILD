# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=gnome-shell-extension-hanabi-git
pkgver=r43.33699b9
pkgrel=1
pkgdesc='Live Wallpaper for GNOME'
arch=(any)
url=https://github.com/jeffshee/gnome-ext-hanabi
license=(GPL3)
makedepends=(meson)
depends=(gnome-shell)
optdepends=('clapper: Hanabi can use clappersink for the best performance' 'gst-plugin-va: experimental performance improvement for Intel/AMD Wayland users')
source=(git+$url)
b2sums=(SKIP)

pkgver() {
	cd gnome-ext-hanabi
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson gnome-ext-hanabi/src build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
