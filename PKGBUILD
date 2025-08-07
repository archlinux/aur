# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
pkgver=8.2.0
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
sha256sums_x86_64=('38865aef9d0a82d1f1ee9e749481082107a047bfe2a97f7618955a8f948015dd')
sha256sums_aarch64=('aacae205b21bc075b82bde6637e1293aaa4df3b12873fcda21e9dda3d9ac10a5')