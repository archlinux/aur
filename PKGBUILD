# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=khaos-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Kafka data generator, load tester and chaos testing tool"
arch=('x86_64' 'aarch64')
url="https://github.com/aleksandarskrbic/khaos"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/khaos_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/khaos_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1fd5126e9b6ef14de9c69cdbeb27ac1a7cdf2fc3e1396f38aa5ed1941d7e9212')
sha256sums_aarch64=('2f486907606fec4c8fb8c857d310fb7e50829602e5693dab155953db2ff6c34d')

package() {
  install -Dm755 "khaos" "${pkgdir}/usr/bin/khaos"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
