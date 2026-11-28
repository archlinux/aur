# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hijagger-bin
pkgver=0.1
pkgrel=1
pkgdesc="Find npm and PyPI packages hijackable through expired maintainer domains"
arch=('x86_64' 'aarch64')
url="https://github.com/firefart/hijagger"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hijagger_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hijagger_Linux_arm64.tar.gz")
sha256sums_x86_64=('7902c26bd3a42130847e7095cec1ea2b3c4705c341857caa645544434015f6f1')
sha256sums_aarch64=('c142632e3760fc349bb3352021150abeb5edc3bc22a6cc7a18655f0f55610dd6')

package() {
  install -Dm755 "hijagger" "${pkgdir}/usr/bin/hijagger"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
