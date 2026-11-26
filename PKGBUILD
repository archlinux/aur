# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leaker-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Passive leak enumeration tool"
arch=('x86_64' 'aarch64')
url="https://github.com/vflame6/leaker"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/leaker_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/leaker_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('319fe42caa5b1008658ab651aa7670d202810b36e89833b1549d35c2f9cc9b9a')
sha256sums_aarch64=('4bde735ed0764f99f0b2c3e3203ac1f991ab362726057a65d7cc0c55ef002357')

package() {
  install -Dm755 "leaker" "${pkgdir}/usr/bin/leaker"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
