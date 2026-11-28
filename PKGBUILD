# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wavedrom-rs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Render digital timing diagrams"
arch=('x86_64')
url="https://github.com/coastalwhite/wavedrom-rs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/wavedrom-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('596958d70660be1bebde0da93f7a7f599a6a0f24d7184b63a35b067201ddab97')

package() {
  install -Dm755 "wavedrom-x86_64-unknown-linux-gnu/wavedrom" "${pkgdir}/usr/bin/wavedrom"
  install -Dm644 "wavedrom-x86_64-unknown-linux-gnu/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "wavedrom-x86_64-unknown-linux-gnu/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "wavedrom-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
