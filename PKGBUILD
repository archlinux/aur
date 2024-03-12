# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=olc-git
pkgver=0.9.2.beta
pkgrel=1
pkgdesc="Open Lighting Console"
arch=(any)
url=https://mikacousin.github.io/olc/
license=("GPL3")
depends=(
  "gtk3"
  "python-cairo"
  "python-gobject"
  "python-mido"
  "python-pyliblo"
  "python-scipy"
  "python-charset-normalizer"
  "python-sacn"
)
makedepends=(
  "git"
  "gobject-introspection"
  "meson"
)
optdepends=(
  "ola: ola backend"
)
source=("olc-$pkgver.tar.gz::https://github.com/mikacousin/olc/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("d99385c82c9f408b6fcb92072b676e7189fd02f4d6516c00d93750680ff17e62")

build() {
  arch-meson olc-$pkgver build --libexec="lib/olc"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
