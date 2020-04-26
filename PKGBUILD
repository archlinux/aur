# Maintainer: Hao Long <aur@esd.cc>

pkgname=massdns
pkgver=0.3
pkgrel=1
pkgdesc="A high-performance DNS stub resolver for bulk lookups and reconnaissance"
arch=("x86_64" "i686")
url="https://github.com/blechschmidt/massdns"
license=("GPL3")
provides=('massdns')
conflicts=('massdns')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9ca6e684d2febf707f165ce74b7a38455302f5851309fb82b5951c28cb07d0d7')

build() {
  cd ${pkgname}-${pkgver}
  cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 massdns ${pkgdir}/usr/bin/massdns
}
