# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cachectl-bin
pkgver=0.3.13
pkgrel=1
pkgdesc="Page cache controller for regular files"
arch=('x86_64' 'aarch64')
url="https://github.com/cubicdaiya/cachectl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cachectl-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cachectl-linux-arm64.tar.gz")
sha256sums_x86_64=('a8b086f05bff9bc9de27aa7bceb0c61b8b3cce1bec9c57cd82c430fc57ce0648')
sha256sums_aarch64=('079c39cafc6db3c0572821f0d3f8d8f152b2ed83589a0431cf6c5f637365ede8')

package() {
  install -Dm755 "cachectld" "${pkgdir}/usr/bin/cachectld"
  install -Dm755 "cachectl" "${pkgdir}/usr/bin/cachectl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
