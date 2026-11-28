# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nyan-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Colorizing cat command"
arch=('x86_64' 'aarch64')
url="https://github.com/toshimaru/nyan"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nyan_Linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nyan_Linux_arm64.tar.gz")
sha256sums_x86_64=('28b981cb882f82a1218ddeacc8c7c1aca326d51c3bed9846caca0a7eaf379d3e')
sha256sums_aarch64=('99d7a8074a768ea3dc5eed258cbe7715ec1d921eef3e278e2d3cef5fbc7cbf76')

package() {
  install -Dm755 "nyan" "${pkgdir}/usr/bin/nyan"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
