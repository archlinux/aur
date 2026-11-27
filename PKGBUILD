# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=railpack-bin
pkgver=0.44.0
pkgrel=1
pkgdesc="Zero-config builder that turns application code into container images"
arch=('x86_64')
url="https://github.com/railwayapp/railpack"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/railpack-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('50b55b6762321c4eb2a2b8850ea0ffcb70b3250f1a2b15519b4901b17ce09411')

package() {
  install -Dm755 "railpack" "${pkgdir}/usr/bin/railpack"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
