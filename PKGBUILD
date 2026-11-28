# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=remoteaudio-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Audio streaming for amateur radio"
arch=('x86_64' 'aarch64')
url="https://github.com/dh1tw/remoteAudio"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dh1tw/remoteAudio/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/remoteAudio-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/remoteAudio-v${pkgver}-linux-arm64.zip")
sha256sums=('378e70c9c3e9d0299329527448690299c1d71f5ab125a7d414888f6ec82f0bf8')
sha256sums_x86_64=('9103cab12a3cbee0809060a5ea3913f76aa371cd086896f63ca9eb3c16a5c543')
sha256sums_aarch64=('13cd865f5ca8f1be34370db1cc64ccdbe657f3e855c558254da425c9b7735cb9')

package() {
  install -Dm755 "remoteAudio" "${pkgdir}/usr/bin/remoteAudio"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
