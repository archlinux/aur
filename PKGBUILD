# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kurpod-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Encrypted file storage server with plausible deniability"
arch=('x86_64' 'aarch64')
url="https://github.com/srv1n/kurpod"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/srv1n/kurpod/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kurpod-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kurpod-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('24bfbf384639b4bbbc253a296db3d3baf982c3c57c1bf4d70f0882fcf71e55b3')
sha256sums_x86_64=('b0128393e54b1372f1c775fa4ec40a7d44373cca69e03a9880a7285d6727ed07')
sha256sums_aarch64=('9b2633843b43647560ed9a030ea444830f2dd7e5d1865801515230b6925c7a23')

package() {
  install -Dm755 "kurpod_server" "${pkgdir}/usr/bin/kurpod_server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
