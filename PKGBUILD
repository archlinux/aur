# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spring-initializr-tui-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Terminal UI for Spring Initializr"
arch=('x86_64')
url="https://github.com/danvega/spring-initializr-tui"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/danvega/spring-initializr-tui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/spring-initializr-tui-linux-x86_64")
sha256sums=('f2f86727875a6cf923f35d71c32ae004981ace138730ab150f49d866deadbf2e')
sha256sums_x86_64=('ffa7eee54f889290ffd9a7f6575a83b72021d61933f4e694c77724f3205fcd76')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/spring-initializr-tui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
