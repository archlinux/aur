# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ccboard-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="TUI and web dashboard for Claude Code sessions, costs and configuration"
arch=('x86_64')
url="https://github.com/FlorianBruniaux/ccboard"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FlorianBruniaux/ccboard/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ccboard-linux-x86_64.tar.gz")
sha256sums=('6e5ead8f5014484b9523932463bb5c8e05db904c71321b2967423c7a27f3f805')
sha256sums_x86_64=('edb5d5c4ae8880ef29a8f9b691f219b5e5f2380985f4849520a0bea580b01daa')

package() {
  install -Dm755 "ccboard" "${pkgdir}/usr/bin/ccboard"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
