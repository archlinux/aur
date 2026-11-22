# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noble-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="A HUD terminal workspace with tabs and splits, git projects, system sensors and AI coding quota"
arch=('x86_64' 'aarch64')
url="https://github.com/MertSoylu/noble"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/noble-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/noble-linux-aarch64.tar.gz")
sha256sums_x86_64=('636f77f568a774d3160bdc82d980387910edca695fcf7e7c53a779a74a7714e2')
sha256sums_aarch64=('d96d6b74b5f20fb5cbaa7dedf537251453ea294ff0b7274cf483fcbb82866eba')

package() {
  install -Dm755 "noble" "${pkgdir}/usr/bin/noble"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
