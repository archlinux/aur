# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lifecycled-bin
pkgver=3.7.1
pkgrel=1
pkgdesc="Daemon for responding to AWS Auto Scaling lifecycle hooks"
arch=('x86_64' 'aarch64')
url="https://github.com/buildkite/lifecycled"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/buildkite/lifecycled/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lifecycled-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-lifecycled::${_dl}/lifecycled-linux-aarch64"
            "${pkgname}-${pkgver}-aarch64-lifecycled::${_dl}/lifecycled-linux-arm64")
sha256sums=('a76c796fe0ae5f05b43294595dab26e35c29df6740d6673ea11516efbdfd5473')
sha256sums_x86_64=('225c7e8ba5cb3ec0ff8502d28099fb79b3e8dd6ead92ca2f60f605917b68d3fc')
sha256sums_aarch64=('496cd0a8fa1096a3b0a52ab5511cde655163f913a5b32df14b4ee42f9094624c' '496cd0a8fa1096a3b0a52ab5511cde655163f913a5b32df14b4ee42f9094624c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lifecycled"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
