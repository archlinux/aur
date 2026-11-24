# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flowrs-bin
pkgver=0.16.7
pkgrel=1
_tag="flowrs-tui-v${pkgver}"
pkgdesc="TUI for Apache Airflow"
arch=('x86_64')
url="https://github.com/jvanbuel/flowrs"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/flowrs-tui-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('bf0ca89432685022fb2872d426dcceb4c615a3fb93e8b89dec246a94ac66bbb9')

package() {
  install -Dm755 "flowrs-tui-x86_64-unknown-linux-gnu/flowrs" "${pkgdir}/usr/bin/flowrs"
  install -Dm644 "flowrs-tui-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "flowrs-tui-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
