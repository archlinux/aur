# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aitutor-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Vimtutor-like interactive guide for AI tools"
arch=('x86_64' 'aarch64')
url="https://github.com/naorpeled/aitutor"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aitutor_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aitutor_linux_arm64.tar.gz")
sha256sums_x86_64=('b9792bf591b6c4f5c4f7dac489c4d846b5b3ca778eeecfac637bb6aa2d5658bf')
sha256sums_aarch64=('29fba4cc4d928085ea93856b320c011d940a49c69ab5885c3eb7702ad7aa3f8f')

package() {
  install -Dm755 "aitutor" "${pkgdir}/usr/bin/aitutor"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
