# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leaker-bin
pkgver=1.9.1
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
sha256sums_x86_64=('b4690a8007d3544e8790e6d8d7c2583a6d08067efc1d23c959001b20086ad1ed')
sha256sums_aarch64=('ea641dc4b981b0144b70a7354aa746f35aa64f03572ca3949fb95beecb11ceed')

package() {
  install -Dm755 "leaker" "${pkgdir}/usr/bin/leaker"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
