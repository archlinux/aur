# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=3.0.0
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL' 'GPL3')
depends=('glibc>=2.19')
options=('!strip')

source=("${pkgname}-launcher-${pkgver}.tar.gz::https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-3.0.0-linux.tar.gz")
sha256sums=('3ce1e3a98547e10dfdaf31114f42b9d0ec8a16f316ea5815743945ed00ba1406')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp "${srcdir}/benchmark-launcher" "${pkgdir}/opt/${pkgname}/benchmark-launcher"
  ln -s "/opt/${pkgname}/benchmark-launcher" "${pkgdir}/usr/bin/${pkgname}"
}