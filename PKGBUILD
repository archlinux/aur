# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=notex-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Open-source alternative to NotebookLM"
arch=('x86_64' 'aarch64')
url="https://github.com/smallnest/notex"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/notex_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/notex_Linux_arm64.tar.gz")
sha256sums_x86_64=('40f6c69027af8eb0b23e6a8461c131fb5287512c70f31b605c6e671e123c0473')
sha256sums_aarch64=('d2b591763bfc2996f7b984585dd57c0f0ef1e90fb35c608530b9d1d295de7bdb')

package() {
  install -Dm755 "notex" "${pkgdir}/usr/bin/notex"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
