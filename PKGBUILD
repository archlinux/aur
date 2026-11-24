# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=browser-use-terminal-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal UI for getting things done in the browser with browser-use"
arch=('x86_64')
url="https://github.com/browser-use/terminal"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/browser-use/terminal/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/browser-use-terminal-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('5afa3d97bf1e6f998d587fa101e3fe0d0c416840b7fe77bcd6ae97690a334631')
sha256sums_x86_64=('8d414a17d0dfb7df282fbc787b276e35feeed8a2ce8b7c3629b13eb4d37817e5')

package() {
  install -Dm755 "browser-use-terminal/bin/browser-use-terminal" "${pkgdir}/usr/bin/browser-use-terminal"
  install -Dm755 "browser-use-terminal/bin/but" "${pkgdir}/usr/bin/but"
  install -Dm755 "browser-use-terminal/bin/agent-tools/rg" "${pkgdir}/usr/bin/rg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
