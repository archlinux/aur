# Maintainer: Hao Long <aur@esd.cc>

pkgname=massdns
pkgver=1.0.0
pkgrel=2
pkgdesc="A high-performance DNS stub resolver for bulk lookups and reconnaissance"
arch=("x86_64" "i686")
url="https://github.com/blechschmidt/massdns"
license=("GPL3")
provides=('massdns')
conflicts=('massdns')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0eba00a03e74a02a78628819741c75c2832fb94223d0ff632249f2cc55d0fdbb')

build() {
  cd ${pkgname}-${pkgver}
  cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 bin/massdns ${pkgdir}/usr/bin/massdns
}
