# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hash-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="POSIX shell that can drive AI coding agents over ACP"
arch=('x86_64' 'aarch64')
url="https://github.com/tfcace/hash"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tfcace/hash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hash_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hash_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('0f0b97729bf7e2fc97c9b7e26a83fa1b469c3b8361bf157896d7e18d0d1ceca1')
sha256sums_x86_64=('4c922c7d4f3148b772c41580222fee1b3a08b9def55fd158e0e534d16e293a30')
sha256sums_aarch64=('a3e97ecfa4d8dbf8dcdd9631d5d52e920e9792ff428958ea053e172a9571691e')

package() {
  install -Dm755 "hash" "${pkgdir}/usr/bin/hash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
