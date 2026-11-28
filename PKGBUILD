# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=unspeech-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Unified proxy for text-to-speech services"
arch=('x86_64' 'aarch64')
url="https://github.com/moeru-ai/unspeech"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/unspeech_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/unspeech_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ac0d66ff3edc6729d79ebae6469a065516be50407ca9a3d7bc1be8c8673b4884')
sha256sums_aarch64=('1e127cdbe18a9267ad55adbd4ecf3f358a48058a3fa2ce5fc87dc248f19151ad')

package() {
  install -Dm755 "unspeech" "${pkgdir}/usr/bin/unspeech"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
