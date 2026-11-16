# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=dash-mpd-cli-bin
pkgver=0.2.35
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
sha256sums_x86_64=('e8d7c4a8c0b2de63157fe7b8a76e2e9499e30e24c8c4ed402f131815b57756f4')

source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/dash-mpd-cli-linux-aarch64")
sha256sums_aarch64=('c53fcf90803b26c017ed16e54f4378d456f112d5d106b381ca819207c0aa3565')

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/${pkgname%-bin}"
  fi
}
