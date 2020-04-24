# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.7.3
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
source=("https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_${pkgver}_linux_amd64.tar.gz")
sha256sums=('de2d79fbf24f7ee800de0baf44fc7f0d0274e88aa94298232b95a5d6aecf9505')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE.md" \
   "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "${srcdir}/cmd/minify/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}