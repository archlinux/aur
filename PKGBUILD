# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=warden-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Secure gateway connecting AI agents to enterprise systems"
arch=('x86_64' 'aarch64')
url="https://github.com/stephnangue/warden"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/warden_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/warden_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4676d21f063504108201440f17b5a3b9d6b7b10d17029a009a906493a76db7fd')
sha256sums_aarch64=('f8c673cbb3bcd7f19d8957d87145e7f0e25836e73bb96d874aa9cf9ca882111d')

package() {
  install -Dm755 "warden" "${pkgdir}/usr/bin/warden"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
