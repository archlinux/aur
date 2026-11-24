# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cctop-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Live top-style monitor for Claude Code sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/stefanprodan/cctop"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cctop_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cctop_linux_arm64.tar.gz")
sha256sums_x86_64=('8c88847c90a31627b2a3c0d858ae0e9ab65481b5b7ffa2eb84b4a302eb24447a')
sha256sums_aarch64=('608cd1f2c3f39db15714177beee2668015c7ed086ca98feed4e3eb2377421fbe')

package() {
  install -Dm755 "cctop" "${pkgdir}/usr/bin/cctop"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
