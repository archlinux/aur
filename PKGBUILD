# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=erldash-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple, terminal-based Erlang dashboard"
arch=('x86_64')
url="https://github.com/sile/erldash"
license=('MIT OR Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sile/erldash/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/erldash-${pkgver}.x86_64-unknown-linux-musl")
sha256sums=('e0c480abbf512eb7e21fd0286bc66778a9fe68193bdf8629e8d99aa6a1e30d91')
sha256sums_x86_64=('7ac1954efd05b26232a4aeeebf801c54d27efe4cd0371fa078cd00b89d57e7af')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/erldash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
