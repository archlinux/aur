# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crlfuzz-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Fast CRLF injection vulnerability scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/dwisiswant0/crlfuzz"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crlfuzz_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/crlfuzz_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('033e97108f1ead4dbd810843316ca3eb9e7be48bb27e058010bd3d919a0a6235')
sha256sums_aarch64=('6f0de652a71827329dbcab504702e4a4464611c99fca2fd1ebd4ed062c58f060')

package() {
  install -Dm755 "crlfuzz" "${pkgdir}/usr/bin/crlfuzz"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
