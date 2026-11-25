# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ethrex-bin
pkgver=32.0.0
pkgrel=1
pkgdesc="Minimal, modular Ethereum protocol implementation in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/lambdaclass/ethrex"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lambdaclass/ethrex/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ethrex-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ethrex-linux-aarch64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('dbb0b97eaa81b06e8ba9bb3071c8e95d3e7796d980990ae035c89ff44b3cba2e')
sha256sums_aarch64=('e411af302ec50664d5fe372775286419d66413814506ee535e1191f587e38ed0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ethrex"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
