# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=4.9
_commit=08d3dfbde51d4cb0a3bb8e58a81aa61064857d89 # tag/v4.9
pkgrel=1
pkgdesc='The theme from libadwaita ported to GTK-3'
arch=(any)
url=https://github.com/lassekongo83/adw-gtk3
license=(LGPL2.1)
makedepends=(git meson sassc)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
