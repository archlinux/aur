# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-on-incus-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Run each AI coding agent in its own Incus container"
arch=('x86_64' 'aarch64')
url="https://github.com/mensfeld/code-on-incus"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mensfeld/code-on-incus/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/coi-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/coi-linux-arm64")
sha256sums=('b86b2744481db41ab552d987135c68c38ce3a7a62221b0b696d8dbff1a8147c1')
sha256sums_x86_64=('241efa7569b115223de4953287ae07d2c589f61ab140ff848446d8a86d15642e')
sha256sums_aarch64=('296733ea75980ee6fac71776427e0e20cd8216de874b9dc18e42a6e650a520a7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/coi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
