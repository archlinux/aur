# Maintainer: Guoyi Zhang <myname at malacology dot net > 
# Contributor: Baytars <feicuihuangfeng@qq.com>

pkgname=fastp
pkgver=1.3.6
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('x86_64')
depends=('libdeflate' 'isa-l' 'gcc-libs' 'highway')
makedepends=('make')
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('55104c5c4d926fa543064b37753630206cc0345fbdc3ee494508f1cbae81463b2bdcc8dc5992a3abcd7fd10cdd1f09eb7db31c4b185905fe85988502cef8e2d5')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
