# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tapo-rest-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Unofficial REST API to control Tapo devices"
arch=('x86_64' 'aarch64')
url="https://github.com/ClementNerma/tapo-rest"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ClementNerma/tapo-rest/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/tapo-rest-x86_64-unknown-linux-musl.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/tapo-rest-aarch64-unknown-linux-musl.tgz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('27de68d1db5c6a5826be3ee6716c1afa0430f978704f2e49818827a4eed1c4b2')
sha256sums_aarch64=('9258192eb5b6f1c63a36eedc2a948ecf5e03a2cdab4acfa4dc05fd218ff43d49')

package() {
  install -Dm755 "tapo-rest" "${pkgdir}/usr/bin/tapo-rest"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
