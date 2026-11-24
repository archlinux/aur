# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tobaru-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="Port forwarding with IP and TLS SNI/ALPN rules"
arch=('x86_64' 'aarch64')
url="https://github.com/cfal/tobaru"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cfal/tobaru/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tobaru-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tobaru-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('1fb83b583e8604eff99cf01dfece917bb0ad56c3101d627516c7b59655375e19')
sha256sums_x86_64=('30ebb427517cd76f79e100f6b527af7f4efce34639fe1a59d1b405092157c725')
sha256sums_aarch64=('215043d83606b374f2260e9942bb19aea23088e6675a9ae39e1253ae52bb0c68')

package() {
  install -Dm755 "tobaru" "${pkgdir}/usr/bin/tobaru"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
