# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Krzysztof Stasiorowski <krzysiekst@gmail.com>
# Contribute : Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=qpxtool-speed47
_pkgver=0.8.1-pl8
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access to all available Quality Checks (Q-Checks) on written and blank media, that are available for your drive, speed47 fork"
arch=(x86_64)
url="https://github.com/speed47/qpxtool"
license=(GPL-2.0-or-later)
depends=(
    glibc
    libgcc
    libpng
    libstdc++
    qt6-base
    )
makedepends=(
    qt6-tools
    )
provides=(qpxtool)
conflicts=(qpxtool)
source=("qpxtool-speed47-${pkgver}.tar.gz::https://github.com/speed47/qpxtool/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('320c38523bab5f96f7f4a3a13129f39a545731b10e0a72da684b05055b1dbcf0')

build() {
  cd "qpxtool-${_pkgver}"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libdir=/usr/lib

  make
}

package() {
  cd "qpxtool-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
