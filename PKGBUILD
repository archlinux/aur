# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-foreach-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Run kubectl commands across multiple contexts in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmetb/kubectl-foreach"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-foreach_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-foreach_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('34cd3dad24738d2c70f792be17c2731e4b46fe6a03209a42a08446d0c60d7ea1')
sha256sums_aarch64=('db293c0bfd485ee2ae2ce9300bc2a5aa9e9baa404ea853bf3e41b9d6e9feaae1')

package() {
  install -Dm755 "kubectl-foreach" "${pkgdir}/usr/bin/kubectl-foreach"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
