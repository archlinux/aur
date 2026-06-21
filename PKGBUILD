# Maintainer: Guoyi Zhang <myname at malacology dot net > 
# Contributor: Baytars <feicuihuangfeng@qq.com>

pkgname=fastp
pkgver=1.3.5
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('x86_64')
depends=('libdeflate' 'isa-l' 'gcc-libs' 'highway')
makedepends=('make')
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c85882555bb9c1d9ff0a4a79efa79655e24e7b65b45da314de667ab03ecdae1f4713e69242526f2dc162b196ae6a8602f0a98378d885cbaa497f44c24ba777ab')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
