# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mindfork-rs-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="A terminal AI chat with a memory and a self-model, on local models through llama.cpp or Ollama"
arch=('x86_64')
url="https://github.com/vshylov/mindfork-rs"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mindfork-rs-v${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('6b2f1b1304ca83bf4ef5f0d09bc2f5711d1b3acfb3d169a05c6d30013aa14ce7')

package() {
  install -Dm755 "mindfork" "${pkgdir}/usr/bin/mindfork"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.ru.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
