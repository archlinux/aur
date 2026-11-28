# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=waf-detector-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="WAF and CDN detection tool"
arch=('x86_64')
url="https://github.com/ammarion/waf-detector"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/waf-detect-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d7fdb5236838c3d24d8851ebf3a54c83e6529a3cdc266990fc159a752597e10d')

package() {
  install -Dm755 "waf-detect-x86_64-unknown-linux-gnu/waf-detect" "${pkgdir}/usr/bin/waf-detect"
  install -Dm644 "waf-detect-x86_64-unknown-linux-gnu/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "waf-detect-x86_64-unknown-linux-gnu/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "waf-detect-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
