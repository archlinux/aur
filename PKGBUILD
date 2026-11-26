# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rustybgp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="BGP daemon written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/osrg/rustybgp"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rustybgp-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rustybgp-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('fafc05cf933b5406eb5751ededc076f1eadf96df60f472e326b53d10eb682a7e')
sha256sums_aarch64=('57e94ce33af5e9c508f7049402a88243fb2e6a8061cf4aa1675f405d1c4f3551')

package() {
  install -Dm755 "rustybgpd" "${pkgdir}/usr/bin/rustybgpd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
