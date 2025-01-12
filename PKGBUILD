# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Gergely Imreh <gergely@imreh.net>

pkgname=abctl
pkgver=0.24.0
pkgrel=1
pkgdesc="Airbyte's CLI for managing local Airbyte installations"
arch=(x86_64 aarch64)
url="https://github.com/airbytehq/abctl"
license=(MIT)
source_x86_64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('46feb4de5f1568047ea7fc227f986bcf2e3a781f32f236dc552d9685fc2fd3c5')
sha256sums_aarch64=('0d3cc361dd8350e94a9167e78f51b05eaae7682cbc2679902a802d76d139315c')

package() {
  sourcename="source_${CARCH}"
  thissource=${!sourcename[0]}
  sourcefile=$(basename "${thissource}")
  sourcedir=${sourcefile%.tar.gz}
  cd "${srcdir}/${sourcedir}" || exit 1
  install -Dm755 abctl "${pkgdir}/usr/bin/abctl"
}
