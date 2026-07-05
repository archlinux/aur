# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=artemis
pkgname=${_pkgname}-bin
pkgver=4.1.5
pkgrel=1
pkgdesc="Radio Signals Recognition Manual"
url="https://aresvalley.com/"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(glibc python qt6-base)
makedepends=(zstd)
source=("${_pkgname}-${pkgver}.tar.zst::https://github.com/AresValley/Artemis/releases/download/v${pkgver}/Artemis-Linux-${arch}-${pkgver}.pkg.tar.zst")
sha256sums=('8052b079d05d0f65af83c9e0b5e4966e943766ad84ac2cdbf92709f9b6b85205')
noextract=("${_pkgname}-${pkgver}.tar.zst")

prepare() {
  cd "${srcdir}"

  tar --zstd -xf "${_pkgname}-${pkgver}.tar.zst"
}

package() {
  cd "${srcdir}"

  # cleanup
  rm -rf usr/src

  # install basic stuff
  mv usr "${pkgdir}/"
}
