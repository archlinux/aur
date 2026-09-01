# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sebastian Bøe <sebastianbooe@gmail.com>
pkgname=icestorm
pkgver=1.1
_git_commit=v${pkgver}
pkgrel=2
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
arch=(x86_64)
url="https://github.com/YosysHQ/icestorm"
license=(ISC)
depends=(python libftdi-compat)
makedepends=(git clang)
provides=(icestorm)
conflicts=(icestorm)
source=("git+https://github.com/YosysHQ/icestorm.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/icestorm"
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/icestorm"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
