# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Gergely Imreh <gergely@imreh.net>

pkgname=abctl
pkgver=0.18.0
pkgrel=1
pkgdesc="Airbyte's CLI for managing local Airbyte installations"
arch=(x86_64 aarch64)
url="https://github.com/airbytehq/abctl"
license=(MIT)
source_x86_64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/airbytehq/abctl/releases/download/v${pkgver}/abctl-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('1320ecb61359630a346a06fd2641b343d8869853278f7ba3b72f7851669f452b')
sha256sums_aarch64=('42631ad9a3d5cdd89761b71775568a22491f64d5c690fa9c47efa5eea0a10a1c')

package() {
  sourcename="source_${CARCH}"
  thissource=${!sourcename[0]}
  sourcefile=$(basename "${thissource}")
  sourcedir=${sourcefile%.tar.gz}
  cd "${srcdir}/${sourcedir}" || exit 1
  install -Dm755 abctl "${pkgdir}/usr/bin/abctl"
}
