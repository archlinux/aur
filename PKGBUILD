# Maintainer: Guoyi Zhang <myname at malacology dot net > 
# Contributor: Baytars <feicuihuangfeng@qq.com>

pkgname=fastp
pkgver=1.4.0
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('x86_64')
depends=('libdeflate' 'isa-l' 'gcc-libs' 'highway')
makedepends=('make')
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('618a6ba2be193c0a0f039a31007beddd16ffa57807b9c2b3fa0978ec9cf1d974202321cae10e532fee90701b5a2c51b3457cecd45e0716eaffede3bd200e90b4')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
