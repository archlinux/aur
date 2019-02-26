# Maintainer: K900 <me@0upti.me>

pkgname=swap
pkgver=0.1.0
pkgrel=1
pkgdesc='A very simple tool to swap two paths atomically using renameat2() on Linux.'
arch=('x86_64')
url='https://gitlab.com/K900/swap'
license=('BSD')
depends=('gcc-libs')
makedepends=('rust')

source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha512sums=('0a111f0687a7309b3b46b3e0e543a3c168f2cacc3c01252a65af4621f1da88ee0125c0ae7e0d1cf01569349cda10bf7aec1dc61e504db3efd9a25bbc119f9f12')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

