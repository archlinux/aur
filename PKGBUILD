# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=acton-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Toolchain for TON smart contract development"
arch=('x86_64' 'aarch64')
url="https://github.com/ton-blockchain/acton"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ton-blockchain/acton/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/acton-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/acton-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('490d6763dcfe148e9c8346e3d56c398e950552d329a768b7e9168d4dd54afe3f')
sha256sums_aarch64=('1af10f5f47bcf7e2317dd70f6926b8ba52f5b9e73481b030ac472920a4c581b2')

package() {
  install -Dm755 "./acton" "${pkgdir}/usr/bin/acton"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
