# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-money-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Self-hosted personal finance manager"
arch=('x86_64' 'aarch64')
url="https://github.com/ft-t/go-money"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-money-server_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-money-server_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4f3f42db58393d7f51cae10d4f84e4e6a3c0090530b4ed6bae2f5aeae7da201f')
sha256sums_aarch64=('824ddb46d980eda854e6f06cface861cf19626c934db359541e3b250126dd980')

package() {
  install -Dm755 "go-money-server" "${pkgdir}/usr/bin/go-money-server"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
