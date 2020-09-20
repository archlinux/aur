# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.9.4
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
optdepends=('bash: For auto-completions')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_linux_amd64.tar.gz")
sha256sums=('d062835ae0f8e0cf4c620fac4411c5edec51f8bd0fc6990bf20860174b3e9a1f')

package() {
  install -Dm755 minify -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 bash_completion "${pkgdir}/etc/bash_completion.d/minify-completion"
}
