# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ccswarm-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Multi-agent orchestration for Claude Code with Git worktree isolation"
arch=('x86_64' 'aarch64')
url="https://github.com/nwiizo/ccswarm"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nwiizo/ccswarm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ccswarm-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ccswarm-linux-arm64.tar.gz")
sha256sums=('c8c3cc0141740573295a98ecd0dffe4e63c5602814eb78817c35fb8a6fc20958')
sha256sums_x86_64=('45291ffe9ada3a678e8f42e06b15bea093df59fd92d1026468c4f91cd04c4ddb')
sha256sums_aarch64=('24c9a06ae6d3e320bfd57c9ae7acc337a47920f994c30d75d94720e95ac9fcbc')

package() {
  install -Dm755 "ccswarm" "${pkgdir}/usr/bin/ccswarm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
