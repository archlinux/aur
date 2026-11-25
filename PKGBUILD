# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mchprs-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A multithreaded Minecraft server built for redstone"
arch=('x86_64' 'aarch64')
url="https://github.com/MCHPR/MCHPRS"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MCHPR/MCHPRS/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mchprs-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mchprs-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('350729881dad819862144a0335562e9da247df532bd8652cb9e524d0eb7f66f6')
sha256sums_x86_64=('8f4c600f95c9c5103ede3041448d1e2598420fe4665851f05ff4667810491812')
sha256sums_aarch64=('606d8b38fada700ac5539f6e4d865b5121ad8d4c9ab02f5ab071b2b85ecd3e36')

package() {
  install -Dm755 "mchprs" "${pkgdir}/usr/bin/mchprs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
