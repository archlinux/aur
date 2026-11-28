# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=octet-bin
pkgver=0.10.7
pkgrel=1
pkgdesc="Fast, extensible coding agent with multimodal inputs"
arch=('x86_64')
url="https://github.com/skaft-software/octet"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/octet-linux-x64-gnu-${pkgver}.tgz")
sha256sums_x86_64=('57b56f1384eebfabbc902ea44ae5f5d32d6b9e6e88afe1d44eeaaf6ef3589456')

package() {
  install -Dm755 "package/bin/octet" "${pkgdir}/usr/bin/octet"
  install -Dm755 "package/bin/octet-host" "${pkgdir}/usr/bin/octet-host"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/crates/sexy-tui-rs/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/extensions/octet-codemode/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/extensions/octet-codemode/vendor/pi-codemode/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/extensions/octet-codemode/vendor/quickjs-wasi/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/share/octet/extensions/octet-pi-compat/LICENSE.pi" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "package/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
