# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=2.0.5
pkgrel=2
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL' 'GPL3')
depends=('glibc>=2.19')
options=('!strip')

source=("${pkgname}-launcher-cli-${pkgver}.tar.gz::https://opendata.blender.org/cdn/BlenderBenchmark2.0/launcher/benchmark-launcher-2.0.5-linux.tar.gz")
sha256sums=('e19e3bb0400351da9635872a38c2573a59d06ba22c21a939e05d47cbbcf46069')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp "${srcdir}/benchmark-launcher" "${pkgdir}/opt/${pkgname}/benchmark-launcher"
  ln -s "/opt/${pkgname}/benchmark-launcher" "${pkgdir}/usr/bin/${pkgname}"
}