# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=2.0.4
pkgrel=2
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL' 'GPL3')
depends=('glibc>=2.19')
options=('!strip')

source=("${pkgname}-launcher-cli-${pkgver}.tar.gz::https://opendata.blender.org/assets/benchmark-launcher-2.0.4-linux.tar.gz")
sha256sums=('6a859a825bd0b92d5863738fcfa4650b7673eafee31820827e51e574c8e2f2fe')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp "${srcdir}/benchmark-launcher" "${pkgdir}/opt/${pkgname}/benchmark-launcher"
  ln -s "/opt/${pkgname}/benchmark-launcher" "${pkgdir}/usr/bin/${pkgname}"
}