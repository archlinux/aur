# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=squad-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Terminal collaboration tool for multiple AI agents"
arch=('x86_64')
url="https://github.com/mco-org/squad"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/squad-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('554023e10f4abf63edf2916b13f1560808e02f68c505b93bf85dd08259ca82d0')

package() {
  install -Dm755 "./squad" "${pkgdir}/usr/bin/squad"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
