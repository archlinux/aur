# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=signls-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Non-linear, generative MIDI sequencer in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/emprcl/signls"
license=('MIT')
depends=('alsa-lib' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/signls_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/signls_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5fbdc844aa3eecccf509677dcb9c3992b12a8944b5c6a1cf67cb3396c163154c')
sha256sums_aarch64=('1854d332a9c531ab38d787dc632ac199690fc3ab7ecb0c97ff6ccd64d1a458a6')

package() {
  install -Dm755 "signls" "${pkgdir}/usr/bin/signls"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
