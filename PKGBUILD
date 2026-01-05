# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=dash-mpd-cli-bin
pkgver=0.2.29
pkgrel=2
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
sha256sums_x86_64=('b4335cb82d3b84351e79e6ef00addf9f22ac678ddf0d1ca98215d8ac93de4be9')

source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dash-mpd-cli-linux-aarch64")
sha256sums_aarch64=('c663af45a44e15b108d0fc94fa7a03be64df1c4e77a4c85f17fc7186354ad35a')

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  fi
}
