# Maintainer: Andy Breuhan <andybreuhan 'at' andybreuhan 'dot' de>

pkgname=blender-benchmark
pkgver=1.0.beta2
pkgrel=1
pkgdesc="Benchmark based on Blender to perform hardware and software performance tests"
arch=('x86_64')
url="https://opendata.blender.org/"
license=('GPL' 'GPL3')
depends=('glibc>=2.19')
options=('!strip')

source=("${pkgname}-${pkgver}-linux-glibc219-x86_64.tar.bz2::https://ftp.nluug.nl/pub/graphics/blender/release/BlenderBenchmark1.0/blender-benchmark-1.0beta2-linux-glibc219-x86_64.tar.bz2")
sha256sums=('df4ca99c4168bba35ec12471214dcdcad901490927f2756775b0d955b4135ddd')

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp -a "${srcdir}/blender-benchmark-1.0b2-linux-glibc219-x86_64"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}