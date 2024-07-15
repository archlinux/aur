# Maintainer: kiri <kiri@vern.cc>

pkgname=kaks_calculator
_pkgname=KaKs_Calculator
pkgver=3.0
pkgrel=2
pkgdesc="Calculating Selective Pressure on Coding and Non-coding Sequences. https://doi.org/10.1016/j.gpb.2021.12.002"
arch=('x86_64')
url="https://ngdc.cncb.ac.cn/biocode/tools/BT000001"
license=('custom')
depends=( 'glibc'
          'gcc-libs')
makedepends=('make')
source=("https://ngdc.cncb.ac.cn/biocode/tools/1/releases/${pkgver}/file/download?filename=${_pkgname}${pkgver}.zip")
sha256sums=('d566a3aba5888d98462388b7922a1bd6ca80959d377f1f862f0636690cf07f44')

build() {
  cd "${_pkgname}${pkgver}/src" || exit
  make
}

package() {
  cd "${_pkgname}${pkgver}/src"
  install -Dm755 ConPairs "$pkgdir"/usr/bin/ConPairs
  install -Dm755 AXTConvertor "$pkgdir"/usr/bin/AXTConvertor
  install -Dm755 KnKs "$pkgdir"/usr/bin/KnKs
  install -Dm755 KaKs "$pkgdir"/usr/bin/KaKs
}
