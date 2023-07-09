# Contributor: Baytars <feicuihuangfeng@qq.com>
# Maintainer: Baytars <feicuihuangfeng@qq.com>
pkgname=fastp
pkgver=0.23.4
pkgrel=3
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('any')
depends=('zlib')
makedepends=('libdeflate' 'isa-l' 'make')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2c929e974708f8cd2d8cab95d59c0a5fd01bea912f6ba5d08841fd929f0f5019ef89e506c771057bd02b879836ae30564b8417271866b6bbcb4917fbeb387e76')


build() {
  cd "${srcdir}/${pkgname}-$pkgver"

  make
}
package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
