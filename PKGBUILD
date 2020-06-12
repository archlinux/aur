# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.7.6
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3f71b3e2a2e4bb2e1929985752595a4ea8518c516cb814c029fad46c8ca9d940')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE.md" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/cmd/minify/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}