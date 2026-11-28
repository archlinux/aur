# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flitter-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="LiveSplit-inspired speedrun split timer for the terminal"
arch=('x86_64')
url="https://github.com/alexozer/flitter"
license=('MIT')
depends=('glibc' 'libgcc' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/flitter-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('61e039d69181b7138df57dc11348686aff9c2bd7267f3a43191baaec08a2f39d')

package() {
  install -Dm755 "flitter-x86_64-unknown-linux-gnu/flitter" "${pkgdir}/usr/bin/flitter"
  install -Dm644 "flitter-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "flitter-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
