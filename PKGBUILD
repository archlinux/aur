# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minify-bin
pkgver=2.7.4
pkgrel=1
pkgdesc="CLI implementation of the minify library package"
arch=('x86_64')
url='https://go.tacodewolff.nl/minify'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tdewolff/minify/releases/download/v${pkgver}/minify_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a6e41ad1f748e40e49e0bed1b688e3dba7225a11802a003dcb20c5f99c3a4514')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE.md" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/cmd/minify/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}