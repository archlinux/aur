# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=dynamic-wallpaper
pkgver=0.0.4
_commit=d43d3c73af028933cbed78aedf7ae3ce73e9735c
pkgrel=1
pkgdesc='Dynamic wallpaper creator for Gnome 42'
arch=(any)
url=https://github.com/dusansimic/dynamic-wallpaper
license=(GPL2)
depends=('python'
         'python-gobject'
         'gtk4'
         'libadwaita>=1.2.0')
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
