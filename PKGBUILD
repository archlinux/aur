# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=crosswords
pkgver=0.3.0
_commit=9242f85065a9a8bfce2663ddad771250e19de993
pkgrel=1
pkgdesc='Crossword player and editor.'
arch=(x86_64)
url=https://gitlab.gnome.org/jrb/crosswords
license=(GPL3)
depends=(libadwaita librsvg libipuz)
makedepends=(meson git)
checkdepends=(appstream-glib)
source=("git+$url.git#commit=$_commit")
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
