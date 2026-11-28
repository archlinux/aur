# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ascii-gif-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Turn a terminal session into an animated GIF with a polished default look"
arch=('x86_64' 'aarch64')
url="https://github.com/tamnd/ascii-gif"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ascii-gif_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ascii-gif_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f4315b920e70bee2460bc70f831f1f857b611e395112a3ac8fd541c00810a93')
sha256sums_aarch64=('567ba73adbed770af350b397345233184fad7a830efa12baea618d05048de4b1')

package() {
  install -Dm755 "ascii-gif" "${pkgdir}/usr/bin/ascii-gif"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
