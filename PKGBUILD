# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=okf-agent-memory-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Git-native persistent memory for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/okf-memory/okf-agent-memory"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/okf-memory/okf-agent-memory/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/okf-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/okf-linux-arm64")
sha256sums=('8de41d98bcdfca0d6a0399820f4d79e0738ff53a5fb04d605d1ecad7871cbafb')
sha256sums_x86_64=('9f866288c53c9acf157b3875aecb5d3acc6de118782b7d76a503a0251a83977f')
sha256sums_aarch64=('864a8b1f1aa985731d3a25a2d37520dba12a9a4dbe4b446f39a7777bbfa53079')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/okf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
