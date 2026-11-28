# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-coverage-report-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Post Go code coverage reports as pull request comments"
arch=('x86_64' 'aarch64')
url="https://github.com/fgrosse/go-coverage-report"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-coverage-report-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-coverage-report-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('117aca67bf67e40d890f33ab5959630695955ad9474abb1ecf69a972be6609af')
sha256sums_aarch64=('6d875f73261758991671b516303f38f731ccac38ebd9c383507606d74221e391')

package() {
  install -Dm755 "go-coverage-report" "${pkgdir}/usr/bin/go-coverage-report"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
