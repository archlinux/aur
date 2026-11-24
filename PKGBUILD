# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=diff-tour-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Read-through tour of a diff in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/init-co-jp/diff-tour"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/diff-tour_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/diff-tour_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('16ca1adf7ce418ef5a39f5d6ce0ed7ba55297e0af90214bb52ef167de5c2a3d7')
sha256sums_aarch64=('1a2f0d273e5d8ed4a911b2d54ecc6fbc08a2328acbf905ff9c7c91a82a219f63')

package() {
  install -Dm755 "tour" "${pkgdir}/usr/bin/tour"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
