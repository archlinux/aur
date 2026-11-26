# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-klock-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="kubectl plugin that renders watch output more readably"
arch=('x86_64' 'aarch64')
url="https://github.com/applejag/kubectl-klock"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-klock_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-klock_linux_arm64.tar.gz")
sha256sums_x86_64=('2e7d0b9b44c6391b8cad90a87d1b3be5ea2a52dd9c5562bd05fe2183d9e5b714')
sha256sums_aarch64=('8dc0b6b193bcc0a1f151efad3e033a3d934ddbba94744d676c60c9d3200e45f5')

package() {
  install -Dm755 "kubectl-klock" "${pkgdir}/usr/bin/kubectl-klock"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
