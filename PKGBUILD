# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-blame-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="kubectl plugin that shows who edited resource fields"
arch=('x86_64' 'aarch64')
url="https://github.com/knight42/kubectl-blame"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-blame-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-blame-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('e20fad89ac3faa4e7032aead252dc0666bccdf2033fd6964eda4b6803ac5a2d0')
sha256sums_aarch64=('03f78d59ff898e2daace6ef1b232a3df77990cdacd440c11557a435257c5bf75')

package() {
  install -Dm755 "kubectl-blame" "${pkgdir}/usr/bin/kubectl-blame"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
