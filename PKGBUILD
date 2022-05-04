# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=dynamic-wallpaper
pkgver=0.0.2
_commit=cfbda706fb9fdd92022c7015baad4d8af0236ba2
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
