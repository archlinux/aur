# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=dash-mpd-cli-bin
pkgver=0.2.32
pkgrel=1
pkgdesc="Download media content from a DASH-MPEG or DASH-WebM MPD manifest "
arch=('x86_64' 'aarch64')
url="https://github.com/emarsden/dash-mpd-cli"
license=('MIT')
depends=()
optdepends=(
  'ffmpeg'
  'vlc'
  'mkvtoolnix-cli'
  'gpac'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/dash-mpd-cli-linux-amd64")
sha256sums_x86_64=('0ddbf6badeaa4a890b50a5d350f68d3653bdd9167d4c936dfc06e6ac54c4d75c')

source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dash-mpd-cli-linux-aarch64")
sha256sums_aarch64=('b5b2f3f3df9b0d309320919131ddafab31b1c3e53ae47499bd4c56a745924ead')

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  fi
}
