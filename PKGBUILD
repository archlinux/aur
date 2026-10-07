# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=olc-git
pkgver=0.11.0.beta
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
sha256sums=('c4256decc9ecc67b8b0280c460821ff37a559d7c65b24bc11467039230658dac')

build() {
  arch-meson olc-$pkgver build --libexec="lib/olc"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
