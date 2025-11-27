# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=home-assistant-lsp
pkgver=2.2.0
pkgrel=1
pkgdesc="Home Assistant LSP from vscode-home-assistant"
arch=('any')
url="https://github.com/keesschollaart81/vscode-home-assistant"
license=('MIT')
depends=(nodejs)
source=("vscode-home-assistant-$pkgver.zip::https://open-vsx.org/api/keesschollaart/vscode-home-assistant/$pkgver/file/keesschollaart.vscode-home-assistant-$pkgver.vsix")
sha256sums=('2c973745101e547107b0c9542abdedd6e7a20cbc5858bccfde471d1a7d3ce152')
b2sums=('fc491939c0296ce405ded62fbef16004101549d2890f24ab480203616cd239807c360b17e59f2c298ce25d68b121389cdbdaaf7b797ad44a87cb7026ceb6a92d')

package() {
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/vscode-home-assistant"
    cp -r "${srcdir}/extension"/{out,node_modules} "${pkgdir}/usr/lib/vscode-home-assistant"
    echo 'node /usr/lib/vscode-home-assistant/out/server/server.js "$@"' > "${pkgdir}/usr/bin/home-assistant-lsp"
    chmod +x "${pkgdir}/usr/bin/home-assistant-lsp"
}
