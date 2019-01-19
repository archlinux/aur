# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Co-maintainer/contributor: Caleb Bassi <calebjbassi@gmail.com>

pkgname=gotop
pkgver=2.0.0
pkgrel=2
pkgdesc='A terminal based graphical activity monitor inspired by gtop and vtop'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/cjbassi/gotop"
license=(AGPL3)
provides=(gotop)
conflicts=(gotop)
makedepends=("go>=1.11.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cjbassi/gotop/archive/${pkgver}.tar.gz")
sha256sums=('50c823b6f774a73bea284172cd1dacc776fe64db6e5b7d20a9f4c0f2456f1dd3')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  go build
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/gotop "${pkgdir}"/usr/bin/gotop
}
