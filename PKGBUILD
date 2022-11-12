# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=dynamic-wallpaper
pkgver=0.1.0
_commit=c9e2e1dcdacf7430a1d450849d2d8eb7daf8804d # tag/0.1.0
pkgrel=1
pkgdesc='Dynamic wallpaper creator for Gnome 42'
arch=(any)
url=https://github.com/dusansimic/dynamic-wallpaper
license=(GPL2)
depends=('python'
         'python-gobject'
         'gtk4'
         'libadwaita>=1.2.0')
makedepends=(meson git blueprint-compiler)
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
