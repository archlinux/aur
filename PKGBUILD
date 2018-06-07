# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=xs
pkgver=1
pkgrel=1
pkgdesc="A FASTQ read simulator"
arch=('x86_64')
url=https://github.com/pratas/"${pkgname}"
license=('GPL2')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/pratas/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('8914433668b9b55fb2240990f532fbf36c9a2162eb15b902db5ce3cc9e4282d3')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make clean
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm755 XS "${pkgdir}"/usr/bin/XS
  install -Dm644 README "${pkgdir}"/usr/share/doc/"${pkgname}"/README
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
