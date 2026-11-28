# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pipewright-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Self-hosted CI/CD, deployment and ops platform in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/huangchengsir/pipewright"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pipewright_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pipewright_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7c415b9a2b620d0f0bc53571f28e81195cc4d9c4d67433dde7fbec9b40055079')
sha256sums_aarch64=('14517b64a857319ba7e78a0ce7205801364ba216a71ad553136d680ad87d1f2a')

package() {
  install -Dm755 "pipewright" "${pkgdir}/usr/bin/pipewright"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
