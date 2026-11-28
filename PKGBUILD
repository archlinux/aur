# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fungi-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Turn your devices into a personal app platform"
arch=('x86_64' 'aarch64')
url="https://github.com/enbop/fungi"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/enbop/fungi/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fungi-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fungi-linux-aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('f7e314615184bee103ee015d581f09e4bb1e4871a6b565690ef04dfc0c5663a7')
sha256sums_aarch64=('c94250a06a89065a495aff2c012ec76a814cfd21b6a57f50fc98baa93496f5bd')

package() {
  install -Dm755 "fungi" "${pkgdir}/usr/bin/fungi"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
