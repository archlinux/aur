# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sato-bin
pkgver=0.1.52
pkgrel=1
pkgdesc="Convert ARM or CloudFormation templates into Terraform"
arch=('x86_64' 'aarch64')
url="https://github.com/JamesWoolfenden/sato"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sato_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sato_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5004baea176dea2d5649b5e1a8d506137a276c0278740e5f48df9f701bf2ccc1')
sha256sums_aarch64=('09a51412764fe9c9cdf6733d78cdf88f3018d65897fa83ad21f5334ff9db1560')

package() {
  install -Dm755 "sato" "${pkgdir}/usr/bin/sato"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
