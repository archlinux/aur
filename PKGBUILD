# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gitlab-ci-pipelines-exporter-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Prometheus / OpenMetrics exporter for GitLab CI pipelines insights"
arch=('x86_64' 'aarch64')
url="https://github.com/mvisonneau/gitlab-ci-pipelines-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gitlab-ci-pipelines-exporter_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gitlab-ci-pipelines-exporter_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6c83cc99278c02d675768b6dc8a59477aea0e82991d76cbfe0ff658321ead2c7')
sha256sums_aarch64=('0ac09c1733a1da1d99e7d32e99d358ac1ddd66512ade91684043f26ac41e0c18')

package() {
  install -Dm755 "gitlab-ci-pipelines-exporter" "${pkgdir}/usr/bin/gitlab-ci-pipelines-exporter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
