# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
optdepends=('bash: For auto-completions')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_linux_amd64.tar.gz")
sha256sums=('b1d04db7a5bbc04f5c2431c17b61dbdeb5e3a5cdc56c4a9b6e322c44ba83e0ea')

package() {
  install -Dm755 minify -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 bash_completion "${pkgdir}/etc/bash_completion.d/minify-completion"
}