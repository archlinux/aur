# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
pkgver=8.1.14
pkgrel=1
pkgdesc="Apipost = Postman + Swagger + Mock + Jmeter"
arch=('x86_64' 'aarch64')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
url="https://www.apipost.cn/"
license=('custom: commercial')
optdepends=('libappindicator-gtk3')

source_x86_64=("apipost_linux_x64_${pkgver}.deb::https://www.apipost.cn/dl.php?client=Linux&arch=x64&version=${pkgver}")
source_aarch64=("apipost_linux_arm64_${pkgver}.deb::https://www.apipost.cn/dl.php?client=Linux&arch=arm64&version=${pkgver}")

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf /opt/Apipost/apipost "${pkgdir}/usr/bin/apipost"
}
sha256sums_x86_64=('93935f581315704ed41040d69fc533bbc8508ff1727faa656e1c3acca4f22cf2')
sha256sums_aarch64=('8913a0be9d9ea448938973f6debcf65eeaae9e54c4800ba8f8eccd6198b19914')