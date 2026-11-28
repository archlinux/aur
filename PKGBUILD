# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=roofer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Large-scale automatic LoD2.2 building reconstruction"
arch=('x86_64')
url="https://github.com/3DBAG/roofer"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/roofer-linux-x86_64-v${pkgver}.tar.gz")
sha256sums_x86_64=('85834b289467b0e583e2b9c59a725c97ef39dc03c0c0a12417a8a0666e1aa0a1')

package() {
  install -Dm755 "bin/roofer" "${pkgdir}/usr/bin/roofer"
  install -Dm644 "share/gdal/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
