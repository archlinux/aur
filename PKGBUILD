# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=avvie
_reponame=Avvie
pkgver=2.4
_commit=c2c6a931cdbd05fbcb0cbe95273da3b5a69f6e18
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
makedepends=(git meson)
checkdepends=(appstream-glib)
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
