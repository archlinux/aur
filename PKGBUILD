# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=revmux-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Supervised, auditable multi-agent code review"
arch=('x86_64' 'aarch64')
url="https://github.com/umputun/revmux"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/revmux_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/revmux_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bf7774111e4190e979ae8e2f1463f9fe04d283ae76a441122e22a584056f8a6f')
sha256sums_aarch64=('f591cbee7fa9b633a04abce897eabddd605eef880748f033885aef5d1a75bb5e')

package() {
  install -Dm755 "revmux" "${pkgdir}/usr/bin/revmux"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
