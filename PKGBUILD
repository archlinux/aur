# Maintainer: Guoyi Zhang <myname at malacology dot net > 
# Contributor: Baytars <feicuihuangfeng@qq.com>

pkgname=fastp
pkgver=1.3.7
pkgrel=1
pkgdesc="a tool designed to provide fast all-in-one preprocessing for FastQ files, developed in C++ with multithreading supported to afford high performance"
url="https://github.com/OpenGene/fastp"
license=('MIT')
arch=('x86_64')
depends=('libdeflate' 'isa-l' 'gcc-libs' 'highway')
makedepends=('make')
source=("https://github.com/OpenGene/fastp/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2979a96738d003444e888c1a8fb1f2fd3d85e92cf18aeff39fbd4ac1fbe54e5379b1b83e4ad389226021344866d3cc329c4b8936742d590755736481244fc201')

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
