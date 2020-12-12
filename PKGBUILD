# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=popsicle
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 i686 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(rust cargo help2man xorgproto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/popsicle/archive/${pkgver}.tar.gz")
sha256sums=('8759512b22539a3547b0bf4a0ec17f61f59868c5c10ea7025fcf417790f2869d')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() { 
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" prefix=/usr install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

