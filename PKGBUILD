# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
pkgver=8.2.1
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
sha256sums_x86_64=('87bb51b12c7f92108ba32a5964868b76dca51ca8443f2512fd195a8696b7150e')
sha256sums_aarch64=('a9cd5af7603b202f0995fc2f36e7d8d322e500da94881baa56f7525a189150fb')