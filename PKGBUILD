# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=colorway
_commit=87bcc4206ee333cc23d818b0f773ebb92dc6ec58
pkgver=1.0.5
pkgrel=1
pkgdesc='Generate color pairings'
arch=(x86_64)
url=https://github.com/lainsce/colorway
license=(GPL3)
depends=(libadwaita json-glib libgee)
makedepends=(meson vala)
#checkdepends=(appstream-glib)
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	arch-meson "$pkgname" build
  meson compile -C build
}

check() {
	:
	# TODO: Add once desktop file is fixed
	#meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
