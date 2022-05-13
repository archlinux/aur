# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=colorway
_commit=b7ff8cf47032251b62e55798c6808f226bd21392
pkgver=1.2.0
pkgrel=2
pkgdesc='Generate color pairings'
arch=(x86_64)
url=https://github.com/lainsce/colorway
license=(GPL3)
depends=(libadwaita json-glib libgee)
makedepends=(git meson vala)
#checkdepends=(appstream-glib)
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=(SKIP)

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
