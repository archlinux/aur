# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Gergely Imreh <gergely@imreh.net>

pkgname=abctl
pkgver=0.17.0
pkgrel=1
pkgdesc="Airbyte's CLI for managing local Airbyte installations"
arch=(x86_64 aarch64)
url="https://github.com/airbytehq/abctl"
license=(MIT)
source_x86_64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('cd63487d7f3f0b7ac02a9b2386a7121435bb80f11c5d86dd9aed3888b2893dbc')
sha256sums_aarch64=('461c312c8c3c4203fbefade67482b6dd76d4b10fa707b6321b9130f3579c1c2d')

package() {
  sourcename="source_${CARCH}"
  thissource=${!sourcename[0]}
  sourcefile=$(basename "${thissource}")
  sourcedir=${sourcefile%.tar.gz}
  cd "${srcdir}/${sourcedir}" || exit 1
  install -Dm755 abctl "${pkgdir}/usr/bin/abctl"
}
