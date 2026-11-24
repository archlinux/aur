# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=code-on-incus-bin
pkgver=0.16.0
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
sha256sums_x86_64=('d0f18584ca412f30d18cd4b44d98ad742ce13ce3875815124b5b0b16195dfd42')
sha256sums_aarch64=('456d4925c153fe31b87b6c978ec222828555eedaf2880ccb9689c805bd163d63')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/coi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
