# Maintainer: Guoyi Zhang <myname at malacology dot net > 
# Contributor: Baytars <feicuihuangfeng@qq.com>

pkgname=fastp
pkgver=1.3.3
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('x86_64')
depends=('libdeflate' 'isa-l' 'gcc-libs' 'highway')
makedepends=('make')
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5ae8aa6a42afb4c442800b431966038b62d6cec93198ff30d57e218d21e96451a5b01a84acea3c521ce3fed23e790afacb12e4280bb5f5f2bb945e9f84f4e90c')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
