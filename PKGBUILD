# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=dash-mpd-cli-bin
pkgver=0.2.33
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
sha256sums_x86_64=('ae4bd21599f4a5af17e8abc101432f16e8d31409dbd74ce6f51abc1778d3e629')

source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dash-mpd-cli-linux-aarch64")
sha256sums_aarch64=('9ec347e35954bc78a588e6f350b409c759ac8aa93ab2edb6049943085c8ac6eb')

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  fi
}
