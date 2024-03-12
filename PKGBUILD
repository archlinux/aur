# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=olc-git
pkgver=0.9.beta
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
sha256sums=("9de12032945c11ac96b4c33b4195f74956adfc2bc210fa0219cd9f313cd1d7e2")

build() {
  arch-meson olc-$pkgver build --libexec="lib/olc"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
