# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=asport-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast, secure QUIC reverse tunnel, an alternative to frp and ngrok"
arch=('x86_64' 'aarch64')
url="https://github.com/AkinoKaede/asport"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/AkinoKaede/asport/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/asport-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/asport-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
sha256sums_x86_64=('1a8f227adf8ab621b228edf8b4094f5b2e53e4be730c8a332de9e86b74cb6e0c')
sha256sums_aarch64=('582d6557e6524637c5f45a147b5adb847721eb41ab181a5cd0d35a118e05c875')

package() {
  install -Dm755 "./asport-client" "${pkgdir}/usr/bin/asport-client"
  install -Dm755 "./asport-server" "${pkgdir}/usr/bin/asport-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
