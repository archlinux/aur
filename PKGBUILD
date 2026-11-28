# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=save-to-spotify-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Save your personal media to Spotify from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/spotify/save-to-spotify"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/spotify/save-to-spotify/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/save-to-spotify-linux-amd64-v${pkgver}.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/save-to-spotify-linux-arm64-v${pkgver}.zip")
sha256sums=('7a34fc99de28aa6cee98e56b545f656df0576b7fbb9664864f6137f930ebbb39')
sha256sums_x86_64=('4bd0ebd6a3fa17d6bced32879727f3d67b27de1be6e3a5614384b1537980eb25')
sha256sums_aarch64=('71977b3a53f04a1e99d11a1b0aabf36a4daad06895daa4df917cddf9dede7aa1')

package() {
  install -Dm755 "save-to-spotify" "${pkgdir}/usr/bin/save-to-spotify"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
