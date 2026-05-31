# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=olc-git
pkgver=0.10.3.beta
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
  "python-scipy"
  "python-charset-normalizer"
  "python-numpy"
  "python-ifaddr"
  "python-pyserial"
  "python-pyzmq"
  "python-textual"
  "python-rich"
  "python-rtmidi"
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
sha256sums=('4cbe40a65aefa5cfd940e9d3125924912f383d405557135d01c8295236119952')

build() {
  arch-meson olc-$pkgver build --libexec="lib/olc"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
