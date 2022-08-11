# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=3.6
_commit=d52e24afcc182fe20d55c1270b8cbb1e3b77ffa6
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
