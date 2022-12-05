# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=popsicle
pkgver=1.3.1
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(git cargo help2man xorgproto)
source=("git+https://github.com/pop-os/popsicle.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  make
}

package() { 
  cd "${pkgname}"
  make DESTDIR="${pkgdir}/" prefix=/usr install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

