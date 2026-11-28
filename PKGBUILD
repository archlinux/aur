# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ipio-bin
pkgver=20270101
pkgrel=1
pkgdesc="Proxy all traffic with a single command"
arch=('x86_64' 'aarch64')
url="https://github.com/txthinking/ipio"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/txthinking/ipio/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ipio_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ipio_linux_arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('92b9ef5e42ca18c53cea047182acd79af61b342ced22855ce7f456cb48eeaf7a')
sha256sums_aarch64=('263e131c7204b29889cea23f96b07d987e241a21a92361a56f6942c3cb22b8ae')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ipio"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
