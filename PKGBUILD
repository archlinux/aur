# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=callfs-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="REST API filesystem with Linux semantics over local, S3 and peer backends"
arch=('x86_64' 'aarch64')
url="https://github.com/ebogdum/callfs"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ebogdum/callfs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/callfs-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/callfs-linux-arm64")
sha256sums=('05c509d5691d63de36456648800752f8c12682380d133b63636623a92c412a6e')
sha256sums_x86_64=('9fc0713bfd79a0b1fe86aa28a5a376c28e7900d86e33c0a023701d59a44c97bd')
sha256sums_aarch64=('d6c3652c65378635e047d67cadc8cbf5c3f819d4a8f8816f6b4391bd2f55ae2a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/callfs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
