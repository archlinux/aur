# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flowlens-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A cross-platform network traffic analyzer with process, IP, and outbound-domain attribution"
arch=('x86_64' 'aarch64')
url="https://github.com/power4j/flowlens"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flowlens-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flowlens-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('46eaf291ea49e44c21064bd4de3e11f567233792a6db9fddb516e5926c3817f7')
sha256sums_aarch64=('d6ee0067fd6ae8ef85566b44105ac553672e14e6ff31617c386e0872a1c24cb8')

package() {
  install -Dm755 "flowlens" "${pkgdir}/usr/bin/flowlens"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
