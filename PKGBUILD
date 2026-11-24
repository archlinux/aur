# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-esp-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Stream Claude Code thinking, tool calls and subagents to a separate terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/phiat/claude-esp"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/phiat/claude-esp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/claude-esp-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/claude-esp-linux-arm64")
sha256sums=('af9f8ff4a22b98445453fc6f732ddfa19a34f9e98e4c6fad53fcf582931e06ba')
sha256sums_x86_64=('7cddb61876235e5113df5d863e52c663b799cb56785f43a446145521f4b22c96')
sha256sums_aarch64=('72d296c533fcb63fd913bf9abe1f68a8bce944dd6b66c5a001fc67a633775dc6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/claude-esp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
