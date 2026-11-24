# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=filecast-lan-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast LAN file transfer over UDP broadcast with packet loss recovery"
arch=('x86_64' 'aarch64')
url="https://github.com/gistrec/filecast"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'filecast')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gistrec/filecast/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/filecast-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/filecast-linux-arm64")
sha256sums=('2ef8044bb3c9692990ff1e33d4da27163cd4e1e9b724a588a9c38a010cb0b6b4')
sha256sums_x86_64=('533e3a581ef5363eddaddefc02a094c9743f6eff5e02bf14ab50b1137cfd0304')
sha256sums_aarch64=('8f52f4f0236947deeb0430f31b61e7f3fccd7091dafee744e5efb11404b4cbfe')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/filecast"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
