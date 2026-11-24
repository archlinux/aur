# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=schemas-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Inspect PostgreSQL schemas via a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/dhth/schemas"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/schemas_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/schemas_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b1cc90335c3d62e4d40d2577b81a4bffaec914452815ab55e59ee2f0ea08a66f')
sha256sums_aarch64=('dfd5be1c672a28636959b2803ee6456d94937b791cd550f426e4507b377e2843')

package() {
  install -Dm755 "schemas" "${pkgdir}/usr/bin/schemas"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
