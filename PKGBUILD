# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gorest-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal REST client like Postman and Insomnia"
arch=('x86_64' 'aarch64')
url="https://github.com/nathanfirmo/gorest"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gorest_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gorest_Linux_arm64.tar.gz")
sha256sums_x86_64=('fb7d045c759889d140a4bdf82801db94a458fc2808e71e7aa3baac1233a69989')
sha256sums_aarch64=('21a7475a66476841def0326be65345fe3fb9297c828f2674907e3636f6f3ddd0')

package() {
  install -Dm755 "gorest" "${pkgdir}/usr/bin/gorest"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
