# Contributor: Baytars <feicuihuangfeng@qq.com>
# Maintainer: Baytars <feicuihuangfeng@qq.com>
pkgname=fastp
pkgver=0.23.3
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('any')
depends=('zlib')
makedepends=('libdeflate' 'isa-l' 'make')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e95170cd65460c683b8d0c33b5b624dd2fb5a1704cea928be9f3176898112902e9e3c7748d132293817878fcd237b590fae92bf71bae289b620bc192e2531016')


build() {
  cd "${srcdir}/${pkgname}-$pkgver"

  make
}
package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  mkdir -p "${pkgdir}/usr/bin/${pkgname}"
  install ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
