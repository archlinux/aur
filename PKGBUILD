# Maintainer: BingBong
# Maintainer: Max Harmathy <harmathy@mailbox.org>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3
pkgver=5.3
pkgrel=3
pkgdesc="An unofficial GTK3 port of libadwaita."
arch=(any)
url="https://github.com/lassekongo83/adw-gtk3"
license=(LGPL-2.1-only)
makedepends=(git meson sassc)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('541fa5747a6d0934660539d357eb3a1ce2723ef97045c002e55ee3b9da38b1ac')

build() {
	arch-meson "$pkgname" build
        meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
