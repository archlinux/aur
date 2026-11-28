# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gentee-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="Script programming language for automation"
arch=('x86_64')
url="https://github.com/gentee/gentee"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gentee/gentee/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gentee-${pkgver}-linux-amd64.zip")
sha256sums=('471c5834b663821395caeffe71e3b3ec92e8644fbf580497ce2b89493ce54cdb')
sha256sums_x86_64=('abb32a9c1fd094f9b7ec18257beea0eeec55377116a04b5b78551a937b356682')

package() {
  install -Dm755 "gentee" "${pkgdir}/usr/bin/gentee"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
