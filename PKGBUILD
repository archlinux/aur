# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nanny-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Monitor the absence of expected activity"
arch=('x86_64')
url="https://github.com/lunemec/nanny"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nanny_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('3b12fc7515909643100366c983a450c69b98a6e3e37cb753c9d2e233bb34b2de')

package() {
  install -Dm755 "nanny" "${pkgdir}/usr/bin/nanny"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
