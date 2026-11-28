# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blackdagger-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="DAG-based automation for DevOps, DevSecOps and continuous red teaming"
arch=('x86_64' 'aarch64')
url="https://github.com/ErdemOzgen/blackdagger"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/blackdagger_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/blackdagger_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d1bdd112ce9ca13162cd23dded737ec8981ef53553ee653eee94f702047ce743')
sha256sums_aarch64=('b4b25614183a115d029c95182bb801ce2e8b36da570a3c4e872667cd4fce8734')

package() {
  install -Dm755 "blackdagger" "${pkgdir}/usr/bin/blackdagger"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
