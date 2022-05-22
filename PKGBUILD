# Contributor: Baytars <feicuihuangfeng@qq.com>
# Maintainer: Baytars <feicuihuangfeng@qq.com>
pkgname=fastp
pkgver=0.23.2
pkgrel=4
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('any')
depends=('zlib')
makedepends=('libdeflate' 'isa-l' 'make')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('70e4050bd0fcb15ec37b3e57bc0e4d7e67c9d1064f9693da86ca7c0d8dd4117be44c1cf93882d74f30774e81fc9f47c0c39e5db2831368aa43c0aa9ed57f2a82')


build() {
  cd "${srcdir}/${pkgname}-$pkgver"

  make
}
package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  mkdir -p "${pkgdir}/usr/bin/${pkgname}"
  install ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
