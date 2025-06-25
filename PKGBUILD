# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
pkgver=8.1.17
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
sha256sums_x86_64=('8fa06c846734703465ccabe299dc8a71956a9a44020ccb4f962fcf6fcfd31f44')
sha256sums_aarch64=('18ac0d5ea43e193dfebd2d1d3c13adebc7cd9d2c9840a90a8f60ff466d1f01e5')