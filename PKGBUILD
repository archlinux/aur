# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pikpakcli-bin
pkgver=0.23
pkgrel=1
pkgdesc="Command-line client for PikPak"
arch=('x86_64' 'aarch64')
url="https://github.com/52funny/pikpakcli"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/52funny/pikpakcli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pikpakcli_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pikpakcli_Linux_arm64.tar.gz")
sha256sums=('586e3f43f12dfbb1cdedcaf157d0db2a6c0178b6d4f52ae8a2748992c7ace4c6')
sha256sums_x86_64=('91bb9407a239c587aeb7a52b2bbf0bfe1319e44d3c9e6a8b278b5f5423566073')
sha256sums_aarch64=('172bc7c962cfdb60e82dd81741236b6e32c5b2720c39ee3afadd5eaf2ab37c87')

package() {
  install -Dm755 "pikpakcli" "${pkgdir}/usr/bin/pikpakcli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
