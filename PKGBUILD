# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.1.2
pkgrel=2
pkgdesc='Fast and secure file transfer'
arch=(x86_64)
url='https://gitlab.gnome.org/World/warp'
license=(GPL3)
depends=(libadwaita)
makedepends=(itstool rust meson git)
checkdepends=(appstream-glib)
_commit=6f34f091d29309320eac8192e1e62bb0a0b38210  # tags/v0.1.2
source=("git+${url}.git#commit=${_commit}")
md5sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
