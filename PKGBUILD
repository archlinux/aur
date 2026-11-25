# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webcodex-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Give cloud AI agents a real development environment on your own machines"
arch=('x86_64' 'aarch64')
url="https://github.com/yyjeqhc/webcodex"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yyjeqhc/webcodex/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/webcodex-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/webcodex-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c95bae1d1ce0235ecccd3560b772ec1efb97f348a79f0fbe0a634f0c2ccefe2c')
sha256sums_x86_64=('6aabd89ddd38e9ef5e47db78e861317c4df792b5e1a27206c80c9563dd7efffd')
sha256sums_aarch64=('c31fe3aa4510b51380c6c195ab8a5f55381a5468b2f9e26a7d0f268c9711f68e')

package() {
  install -Dm755 "webcodex" "${pkgdir}/usr/bin/webcodex"
  install -Dm755 "webcodex-server" "${pkgdir}/usr/bin/webcodex-server"
  install -Dm755 "webcodex-runner" "${pkgdir}/usr/bin/webcodex-runner"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
