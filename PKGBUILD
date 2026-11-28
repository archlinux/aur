# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kessoku-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Parallel dependency injection code generator for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/mazrean/kessoku"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kessoku_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kessoku_Linux_arm64.tar.gz")
sha256sums_x86_64=('42257f1a64b4f0f134a183df5450a165f9a06ab1348f1d2a839af0a988505dec')
sha256sums_aarch64=('92d844658ac2eef08c584540e6afb54d8a291ab58e9778c58c466dc538d630bd')

package() {
  install -Dm755 "kessoku" "${pkgdir}/usr/bin/kessoku"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
