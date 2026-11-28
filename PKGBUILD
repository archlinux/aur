# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=testifylint-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="Go linter that checks usage of testify"
arch=('x86_64' 'aarch64')
url="https://github.com/Antonboom/testifylint"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/testifylint_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/testifylint_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('82a756a513ad353cb719275a32a1b6426e974b2a7eb2e88c1d5810fdd99205e5')
sha256sums_aarch64=('ba2cdb6ed8f40690254c4078c0060ffdc0c7a365639119d282a0e3ab0f2a54e4')

package() {
  install -Dm755 "testifylint" "${pkgdir}/usr/bin/testifylint"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
