# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leptosfmt-bin
pkgver=0.1.34
pkgrel=1
pkgdesc="Formatter for the Leptos view! macro"
arch=('x86_64')
url="https://github.com/bram209/leptosfmt"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/leptosfmt-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0fc9700082e51e2089a86f117c7b9a7686ae5b69ea53842c6fa9b4c56aa34d8f')

package() {
  install -Dm755 "./leptosfmt" "${pkgdir}/usr/bin/leptosfmt"
  install -Dm644 "./LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
