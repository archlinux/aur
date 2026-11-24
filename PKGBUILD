# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chiko-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="gRPC client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/felangga/chiko"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chiko_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chiko_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('af378779e2e643dc349a26f709436bc1e435dbe90ff7b39a9521b04215ba6964')
sha256sums_aarch64=('4b0af99fc967e77a3f85515a91742ba059fc69833e0759babeeff5f7d7f9b04c')

package() {
  install -Dm755 "chiko" "${pkgdir}/usr/bin/chiko"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
