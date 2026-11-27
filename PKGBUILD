# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nonograph-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Minimalist anonymous publishing tool"
arch=('x86_64' 'aarch64')
url="https://github.com/du82/nonograph"
license=('Unlicense')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nonograph-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nonograph-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1c6770dd96f9564e3e64aeb09477a60dd3315fab6489c691cc7069abc2532aa9')
sha256sums_aarch64=('c50f18fdc1a4db52ac142a42b15708885a026f73f8bc2be4425d7c775d592b90')

package() {
  install -Dm755 "./nonograph" "${pkgdir}/usr/bin/nonograph"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
