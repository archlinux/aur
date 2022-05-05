# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=avvie
_reponame=Avvie
pkgver=2.1
_commit=e42f8833a59c516ce112b0797a2a031801568e6a
pkgrel=1
pkgdesc="A utility for quickly cropping images"
arch=(x86_64)
url=https://github.com/Taiko2k/Avvie
license=(GPL3)
depends=(gtk4
         libadwaita
         libnotify
         python-cairo
         python-gobject
         python-piexif
         python-pillow)
makedepends=(git)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	arch-meson "$_reponame" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
