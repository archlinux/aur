# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fisco-bcos-bin
pkgver=3.16.4
pkgrel=1
pkgdesc="FISCO BCOS/fskl bi:kz/5000400FISCO BCOS (pronounced /fskl bi:kz/) is a stable, efficient, and secure permissioned blockchain platform that has been widely used in real-world industry applications"
arch=('x86_64' 'aarch64')
url="https://github.com/FISCO-BCOS/FISCO-BCOS"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FISCO-BCOS/FISCO-BCOS/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fisco-bcos-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fisco-bcos-linux-aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('7015851c8e7eab3b05a882cfdd71d18567f69bb2b7b79f68205c0b77d8b9d18c')
sha256sums_aarch64=('b9dc00534589bca579bf18b8dbbb5fea5bb96d066fe18ee87619beffc2a6baa3')

package() {
  install -Dm755 "fisco-bcos" "${pkgdir}/usr/bin/fisco-bcos"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
