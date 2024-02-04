# Maintainer: Max Harmathy <harmathy@mailbox.org>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=5.2
pkgrel=1
pkgdesc='The theme from libadwaita ported to GTK-3'
arch=(any)
url=https://github.com/lassekongo83/adw-gtk3
license=(LGPL2.1)
makedepends=(git meson sassc)
source=("git+$url.git#tag=v$pkgver")
md5sums=(SKIP)

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
