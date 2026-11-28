# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=terrier-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Scan images and containers for files matching specific hashes"
arch=('x86_64')
url="https://github.com/heroku/terrier"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/heroku/terrier/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/terrier-linux-amd64")
sha256sums=('f6c08262403b9d3989012cbf192f3a9f946ce9c0c27dab126346de3808a2b3d7')
sha256sums_x86_64=('d1e24779fa2aa2111cec044d6594da612e97a97fccd3b22bcdd421e00640a8f4')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/terrier"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
