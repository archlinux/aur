# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=stencil-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Schema registry with dynamic schema management and validation"
arch=('x86_64' 'aarch64')
url="https://github.com/raystack/stencil"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/stencil_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/stencil_Linux_arm64.tar.gz")
sha256sums_x86_64=('2f1e0c2a36abbce68012e0c0a88674ff7c99f6aaed1b2b8175046a7270611f8b')
sha256sums_aarch64=('04926367822637d5a3d1939cbe0e737906d8d30637e8508252c09baa63bfea91')

package() {
  install -Dm755 "stencil" "${pkgdir}/usr/bin/stencil"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
