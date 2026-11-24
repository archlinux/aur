# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gormt-bin
pkgver=2.1.gorm
pkgrel=1
pkgdesc="Generate Go structs for GORM from a database schema, with a terminal UI"
arch=('x86_64')
url="https://github.com/xxjwxc/gormt"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xxjwxc/gormt/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gormt_linux.zip")
sha256sums=('7c209b86e71eed2390cd806350ec2205b69c125204f60adde2b1c70ed80c8969')
sha256sums_x86_64=('96a6a2ff8f275ce1958aa010327211cc1a56f185c40435f00ec8f50dfe6bcfeb')

package() {
  install -Dm755 "gormt" "${pkgdir}/usr/bin/gormt"
  install -Dm644 "config.yml" "${pkgdir}/usr/share/doc/${pkgname}/config.yml.example"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
