# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gonc-bin
pkgver=2.6.13
pkgrel=1
pkgdesc="Netcat with automated NAT traversal, secure P2P, file transfer and proxying"
arch=('x86_64' 'aarch64')
url="https://github.com/threatexpert/gonc"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/threatexpert/gonc/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gonc_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gonc_linux_arm64")
sha256sums=('83c3d1731419402c8aebb8ffd26ce9e7f6bccb5faedd86c9bbe2336bc203f775')
sha256sums_x86_64=('6f32be2fa207ded0a80417e731f6605c85662687db3bb2358ae4e87943996f40')
sha256sums_aarch64=('c5068297a004217f0fb3f98a9a0e5ae6072943c2f7daedf5b199a4ec43f5ecb3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gonc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
