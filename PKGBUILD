# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pixivbiu-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="Pixiv browsing and download client with a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/txperl/PixivBiu"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/PixivBiu_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/PixivBiu_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d4811da7792580a44136d3883b2b2d8158b63de791463e731caf73f873500bdd')
sha256sums_aarch64=('1f438d5ec7a38a772cf841a22f2414177c5ef3f2c845e25ef15032889760fe49')

package() {
  install -Dm755 "pixivbiu" "${pkgdir}/usr/bin/pixivbiu"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
