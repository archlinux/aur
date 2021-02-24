# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-tbb
pkgver=2020.3
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="https://threadingbuildingblocks.org"
license=('Apache')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs')
provides=('lib32-intel-tbb')
conflicts=('lib32-intel-tbb')
replaces=('lib32-intel-tbb')
source=("${pkgname#lib32-}-${pkgver}.tar.gz::https://github.com/oneapi-src/oneTBB/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ea1ffd22c7234d715b8c46a4e51b40719c7a9b8837ab3166f1da5a2c6061167c2be2126b1d74fd361eec6975b8fce0df26829ca2e7af8029edbb52e40f23d630')

build() {
  cd "oneTBB-${pkgver}"
  make
}

package() {
  cd "oneTBB-${pkgver}"
  install -Dm755 build/linux_*/*.so* -t "${pkgdir}/usr/lib32"
}
