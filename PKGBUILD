# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=benchi-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Benchmark any tool from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/ConduitIO/benchi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/benchi_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/benchi_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('829842d4db3fcf63f1d8e138bb7d83837616089103e08e07b3e9d056ea35af81')
sha256sums_aarch64=('b3af8499bebd01158ca26c3b330b59a829632c7a27dfd23a4109ba153e90e99b')

package() {
  install -Dm755 "benchi" "${pkgdir}/usr/bin/benchi"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
