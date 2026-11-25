# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=testfixtures-bin
pkgver=3.19.0
pkgrel=1
pkgdesc="Rails-style test fixtures for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/go-testfixtures/testfixtures"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/testfixtures_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/testfixtures_linux_arm64.tar.gz")
sha256sums_x86_64=('d78f3dc57bcc0b2570a419dcef13f3914a4a0db3217ae28712f8ad0426b5a7a7')
sha256sums_aarch64=('5906f13bcd303d8434b5dffc4ac671969fad3a4ea2d36f2cfec89a45d00e7575')

package() {
  install -Dm755 "testfixtures" "${pkgdir}/usr/bin/testfixtures"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
