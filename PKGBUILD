# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dashboard-linter-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Lint Grafana dashboards"
arch=('x86_64' 'aarch64')
url="https://github.com/grafana/dashboard-linter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dashboard-linter_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dashboard-linter_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('108004b1020eac3f578752d3245def9180ea08667fe25d54a09a422039b13aab')
sha256sums_aarch64=('7dae2f1882dc1dcedd9d65a54115b4d9a579579d8f7a4667b169fcb8508487b3')

package() {
  install -Dm755 "dashboard-linter" "${pkgdir}/usr/bin/dashboard-linter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
