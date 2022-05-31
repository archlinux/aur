# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=crosswords
pkgver=0.3.2
_commit=590216093a630e7a596bce309b5d23fcd4b51c7d
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
