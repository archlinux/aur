# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sharkord-bin
pkgver=0.0.32
pkgrel=1
pkgdesc="Lightweight self-hosted chat server with voice, video, text and screen sharing"
arch=('x86_64' 'aarch64')
url="https://github.com/Sharkord/sharkord"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Sharkord/sharkord/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sharkord-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sharkord-linux-arm64")
sha256sums=('2e6d0651742cf8c9bde6aa7713e06f82db92143732c7a5b430f5a5ccbd6891f9')
sha256sums_x86_64=('6cc6d2448b5eeeb23f459d2b4d80763652ea0520ef16019c26f9474bcace5e3c')
sha256sums_aarch64=('d8d9dc08daafa64a3b5d0ec3401d882546e14a3acf14585bab232470e6407840')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sharkord"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
