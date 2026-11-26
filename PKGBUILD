# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=scenarigo-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="End-to-end scenario testing for HTTP and gRPC servers"
arch=('x86_64')
url="https://github.com/scenarigo/scenarigo"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/scenarigo_v${pkgver}_go1.26.0_Linux_x86_64.tar.gz")
sha256sums_x86_64=('c3fd00b8309508d9a4eba8e3881ee5e60ff18a417cd05af6cadc301ab4123e56')

package() {
  install -Dm755 "scenarigo" "${pkgdir}/usr/bin/scenarigo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
