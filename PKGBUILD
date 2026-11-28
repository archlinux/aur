# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=labean-bin
pkgver=260531
pkgrel=1
pkgdesc="HTTP/HTTPS port knocker"
arch=('x86_64' 'aarch64')
url="https://github.com/noiseonwires/labean"
license=('BSD-2-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/noiseonwires/labean/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/labean-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/labean-linux-arm64")
sha256sums=('d82630bd62934c16703bc81b93d3c3b5a61d03fc437529c4eef0336c940ff360')
sha256sums_x86_64=('ec42c38bf594b78d22b82577d21c62a37f53f9e3f23fddbef3afbac7ec9eb416')
sha256sums_aarch64=('184ea2796a1bf10272a27cbdd8519801dfd5764028ef412638edd25961bb01d0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/labean"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
