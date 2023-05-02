# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=4.6
_commit=f26e86c8a7b40ac23f165efdb620f734c0f1db23 # tag/v4.6
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
