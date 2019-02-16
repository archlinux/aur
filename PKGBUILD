# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Co-maintainer/contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=2.0.2
pkgrel=1
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
provides=(gotop)
conflicts=(gotop)
makedepends=("go>=1.11.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('332a3677b7fd8d4b84beb7ddf9a07189ca996c5c2dcd3432c9820735ec4429ea')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  go build
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
}
