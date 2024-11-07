# Maintainer: this.ven <https://this.ven.uber.space>
pkgname=bielebridge
pkgver=0.0.6
pkgrel=1
pkgdesc="Challenging 2D bridge construction game"
arch=(x86_64)
url="https://bielebridge.net"
license=(GPL-3.0-or-later)
makedepends=(git)
depends=(glu lua sdl2_gfx sdl2_image sdl2_ttf)
source=(git+https://gitlab.digitalcourage.de/georg/$pkgname.git)
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
