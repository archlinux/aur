# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=3.1.0
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL' 'GPL3')
depends=('glibc>=2.19')
options=('!strip')

source=("${pkgname}-launcher-${pkgver}.tar.gz::https://download.blender.org/release/BlenderBenchmark2.0/launcher/benchmark-launcher-3.1.0-linux.tar.gz")
sha256sums=('4059c576407aa5add4f6280c59d68070b721572ec91aa6d5dfd528441070bb62')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp "${srcdir}/benchmark-launcher" "${pkgdir}/opt/${pkgname}/benchmark-launcher"
  ln -s "/opt/${pkgname}/benchmark-launcher" "${pkgdir}/usr/bin/${pkgname}"
}
