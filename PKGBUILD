# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gptme-bin
pkgver=0.37.0
pkgrel=1
pkgdesc="Your agent in your terminal, equipped with local tools: writes code, uses the terminal, browses the web"
arch=('x86_64')
url="https://github.com/gptme/gptme"
license=('MIT')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gptme/gptme/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gptme-server-bin-${pkgver}-linux-x64.tar.gz")
sha256sums=('57efff501c55fb6466314bab6b07318d27d99d5f5ab0fe4d39a689631cb0c2ac')
sha256sums_x86_64=('c61fa4583ec47fff6bc7847b8ecdb06bf9e512a5da300b96fdf4176f50dce47b')

package() {
  install -Dm755 "gptme-server" "${pkgdir}/usr/bin/gptme-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
