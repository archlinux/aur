# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trust-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Turbo Pascal-style Rust IDE for the terminal"
arch=('x86_64')
url="https://github.com/wojtczyk/trust"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trust-linux-x86_64.tar.gz")
sha256sums_x86_64=('1354528550807b25cfc1ce6e45c6032b94b1fb80e84956b9126af8f3ef79b05e')

package() {
  install -Dm755 "trust-linux-x86_64/trust" "${pkgdir}/usr/bin/trust-ide"
  install -Dm644 "trust-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "trust-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
