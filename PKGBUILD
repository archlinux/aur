# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zkar-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Java serialization protocol analysis tool"
arch=('x86_64' 'aarch64')
url="https://github.com/phith0n/zkar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zkar_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zkar_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e49072e4d17acd0adba97093fcdc2809b37411bb280051d85a7cd51fc0e5c278')
sha256sums_aarch64=('828295f42d0db7553d2132e9967dbc56882adb0492ad1c57b6c1d8ed04a3dad0')

package() {
  install -Dm755 "zkar" "${pkgdir}/usr/bin/zkar"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
