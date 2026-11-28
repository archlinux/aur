# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fluentci-engine-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Programmable container-free CI/CD engine built on Wasm and Nix"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci-engine"
license=('MPL-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fluentci-io/fluentci-engine/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fluentci-engine_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fluentci-engine_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('dae9c2728399d54043ff4baf0783a6564df95484123d6432c050eb86eef6d21f')
sha256sums_x86_64=('74903908c6e9fc057a2ed0b23cf48ed7c391e57b9b41ea8b56971fcc4c98428c')
sha256sums_aarch64=('6374c7d95f7ff12a78ef34072001ade7c3fae0a748a0128d3b474eec5a103089')

package() {
  install -Dm755 "fluentci-engine" "${pkgdir}/usr/bin/fluentci-engine"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
