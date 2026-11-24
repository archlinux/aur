# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=toktrack-bin
pkgver=2.18.0
pkgrel=1
pkgdesc="Fast token and cost tracker for LLM coding tools"
arch=('x86_64' 'aarch64')
url="https://github.com/mag123c/toktrack"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mag123c/toktrack/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/toktrack-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/toktrack-linux-arm64.tar.gz")
sha256sums=('5315058f302bf7aa21a1d9aa77973721b8b3e31c817f20eddeefd115321705e3')
sha256sums_x86_64=('7ca695be6191f0b6233ad3a6c6518950b2f1f5905b962cc682e5031ad564b83e')
sha256sums_aarch64=('d2050d769fc624c0e541906f66595a9d2f5f4bf6fb2b731914fa192699223648')

package() {
  install -Dm755 "toktrack" "${pkgdir}/usr/bin/toktrack"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
