# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=3.4
_commit=0e9fd11cd39ae3525c02b95c0a5e297a748be522
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
