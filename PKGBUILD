# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=peco-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Simplistic interactive filtering tool"
arch=('x86_64')
url='https://github.com/peco/peco'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/peco_linux_amd64.tar.gz"
				'LICENSE::https://github.com/peco/peco/raw/master/LICENSE')
sha256sums=('d273c8adcd173ab982168a04068b1733e1f20b3193a143f1719e34881aa546e1'
						'38c6b4a6df580c74891927faf550dc6f7c41a51d3017c0a352be339d4a5b69f3')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}_linux_amd64/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/${pkgname%-bin}_linux_amd64/README.md" \
   -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}