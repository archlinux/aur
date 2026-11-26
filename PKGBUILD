# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-arch-lint-bin
pkgver=1.19.2
pkgrel=1
pkgdesc="Architecture linter for Go projects"
arch=('x86_64' 'aarch64')
url="https://github.com/fe3dback/go-arch-lint"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-arch-lint_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-arch-lint_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('09bbdb8f2e8a578806e20e1dd28dba04b47026e21ae520cdb3157f95d9b2e23b')
sha256sums_aarch64=('41f6dea32cfe0cc03ffe5fd1cf7cfb4137f1fe8f183ae0a9139bf96d1bd1a6bf')

package() {
  install -Dm755 "go-arch-lint" "${pkgdir}/usr/bin/go-arch-lint"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
