# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leetsolv-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Spaced repetition CLI for data structures and algorithms practice"
arch=('x86_64' 'aarch64')
url="https://github.com/eannchen/leetsolv"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/eannchen/leetsolv/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/leetsolv-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/leetsolv-linux-arm64")
sha256sums=('deefa239c1cdf6beb36d07d7e59a3d80c58bc44a111880c3fcaf090f0133c8d4')
sha256sums_x86_64=('5f8c9d188287042a5a3392cd6da45d4d5275708805f97d6ad1da788dabbf6df2')
sha256sums_aarch64=('b000d59691a22da80821e087fa4cb2b76aaf3a967adac864fee21b2cfda0cbdb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/leetsolv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
