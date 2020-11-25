# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.9.10
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
optdepends=('bash: For auto-completions')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_linux_amd64.tar.gz")
sha256sums=('cbbe82f966b63768cf4fa678b0993a0d4b2918ff611d3e693fdb42d08d4c6c67')

package() {
  install -Dm755 minify -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 bash_completion "${pkgdir}/etc/bash_completion.d/minify-completion"
}
