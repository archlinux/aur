# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kcctl-bin
pkgver=1.0.0.CR5
pkgrel=1
pkgdesc="Command-line client for Kafka Connect"
arch=('x86_64')
url="https://github.com/kcctl/kcctl"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/kcctl-${pkgver}-linux-x86_64.zip")
sha256sums_x86_64=('b355ca874a4cea028a9389381abeb77eecb889c8b0bedf833eb1d3f5bba2d561')

package() {
  install -Dm755 "kcctl-${pkgver}-linux-x86_64/bin/kcctl" "${pkgdir}/usr/bin/kcctl"
  install -Dm644 "kcctl-${pkgver}-linux-x86_64/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
