# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=olc
pkgver=0.8.5.beta
pkgrel=4
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
sha256sums=("06a7dd9b7d2c2695a9f6f439f7fc0f943d2bc5ec43764475ea644e1bf9139b54")

build() {
  arch-meson olc-$pkgver build --libexec="lib/olc"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
