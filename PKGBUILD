# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
pkgver=8.2.3
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
sha256sums_x86_64=('c1e77d486de44f4b9d8b72875315e07b51ef5260a6b5ee2f4505c8d7e8082171')
sha256sums_aarch64=('0881677c8be3752248f7f4a9d9e346a18f3c9e95600bd1082104bf783b0560fa')