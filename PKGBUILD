# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=dynamic-wallpaper
pkgver=0.0.3
_commit=b5edf84517063aa5c6d132f01abf6ffa9a9e19b0
pkgrel=1
pkgdesc='Dynamic wallpaper creator for Gnome 42'
arch=(any)
url=https://github.com/dusansimic/dynamic-wallpaper
license=(GPL2)
depends=(python gtk4 libadwaita)
makedepends=(meson git)
checkdepends=(appstream-glib)
source=("git+$url#commit=$_commit")
md5sums=('SKIP')

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
