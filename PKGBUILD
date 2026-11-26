# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=airpipe-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Send files between your terminal and any device by scanning a QR code"
arch=('x86_64' 'aarch64')
url="https://github.com/Sanyam-G/Airpipe"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Sanyam-G/Airpipe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/airpipe-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/airpipe-linux-arm64")
sha256sums=('c9481fc580be43cca977ce590f61c645f1f73f0ef25b5d1cd94c022481606acb')
sha256sums_x86_64=('d72a476fc8abc87cb20fbddb161805851da32019128cc3a7db59319299f34a5d')
sha256sums_aarch64=('708b3f363a29b2d5d63a548f9ee08d4011e17e8d525238be12d137754c78e1c6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/airpipe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
