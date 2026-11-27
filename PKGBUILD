# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gogg-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A multiplatform game file downloader for GOG"
arch=('x86_64' 'aarch64')
url="https://github.com/habedi/gogg"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libglvnd' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/habedi/gogg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gogg-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gogg-linux-arm64.zip")
sha256sums=('dc49155c3d9e9284a51a392dbb130a66d873fe2279c870cce3311c16a8b34330')
sha256sums_x86_64=('0dd742b3f001918cf414fffbd2289513ab855f932e02164c19e5296edaf9d568')
sha256sums_aarch64=('8d4abe82f41b7e4fc616193c46f0a4752b3e37acff7eeb2f62675256f4aad08a')

package() {
  install -Dm755 "gogg" "${pkgdir}/usr/bin/gogg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
