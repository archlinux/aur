# Maintainer: Hao Long <aur@esd.cc>

pkgname=massdns
pkgver=1.1.0
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
b2sums=('fecc2e0cdaa3a247ba9265b5e57b27d56f2e881f29f4e4199b4c1761561efc464f76bbc957011165977853f0a1c1c32f9f7089b189664a991b1047eb7c60fdb6')

build() {
  cd ${pkgname}-${pkgver}
  cmake .
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 bin/massdns ${pkgdir}/usr/bin/massdns
}
