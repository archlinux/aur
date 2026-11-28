# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gridbash-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal grid for running Codex, Claude, Gemini and other CLI agents side by side"
arch=('x86_64' 'aarch64')
url="https://github.com/jasonsuhari/gridbash"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jasonsuhari/gridbash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/gridbash-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/gridbash-linux-arm64-${pkgver}.tgz")
sha256sums=('a58839186da4e4f05a375bff769e52e5fec022f8fc28cc80deb2d056ed428b71')
sha256sums_x86_64=('363a87f8f8e3b13e9f74f3e4b2eb4b9ad427c640ec1c1dda2309cbb132f88cd0')
sha256sums_aarch64=('9eeb61eb79824c859663f8119850e6d93ce9600c2d23f5cfbc1315866e27738c')

package() {
  install -Dm755 "package/bin/gridbash" "${pkgdir}/usr/bin/gridbash"
  install -Dm755 "package/bin/gridbash-voice" "${pkgdir}/usr/bin/gridbash-voice"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
