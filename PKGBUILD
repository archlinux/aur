# Maintainer: pinsl <johannes.neyer at gmail dot com>

pkgname=nrfutil
pkgver=8.1.1
pkgrel=1
pkgdesc="unified command line utility for Nordic products"
arch=("x86_64")
url="https://www.nordicsemi.com/Products/Development-tools/nRF-Util"
license=("custom")
optdepends=("jlink-software-and-documentation: for some commands (e.g. device)")
source=("https://files.nordicsemi.com/ui/api/v1/download?repoKey=swtools&path=external/nrfutil/packages/nrfutil/nrfutil-${arch}-unknown-linux-gnu-${pkgver}.tar.gz")
sha256sums=("6ac5f551b004e97d3794b0b797d7bff46d9681545ecdf9910fa7725c929bd7c6")

package() {
  cd "${srcdir}/nrfutil-${arch}-unknown-linux-gnu-${pkgver}/data/"
  install -Dm644 share/nrfutil-core/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/nrfutil "${pkgdir}/usr/bin/nrfutil"
}
