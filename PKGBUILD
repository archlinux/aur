# Maintainer: pinsl <johannes.neyer at gmail dot com>

pkgname=nrfutil
pkgver=7.13.0
pkgrel=1
pkgdesc="unified command line utility for Nordic products"
arch=("x86_64")
url="https://www.nordicsemi.com/Products/Development-tools/nRF-Util"
license=("custom")
depends=("jlink-software-and-documentation")
source=("https://files.nordicsemi.com/ui/api/v1/download?repoKey=swtools&path=external/nrfutil/packages/nrfutil/nrfutil-${arch}-unknown-linux-gnu-${pkgver}.tar.gz")
sha256sums=("477385ff7e34c4469bfb4cda99fc2f7a3635e9f8f2ff74ebcccbd0681955c47c")

package() {
  cd "${srcdir}/nrfutil-${arch}-unknown-linux-gnu-${pkgver}/data/"
  install -Dm644 share/nrfutil-core/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/nrfutil "${pkgdir}/usr/bin/nrfutil"
}
