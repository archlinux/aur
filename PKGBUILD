# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seqfu2-bin
pkgver=1.29.0
pkgrel=1
pkgdesc="Sequence FASTX utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/telatin/seqfu2"
license=('GPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/telatin/seqfu2/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/seqfu-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/seqfu-linux-aarch64")
sha256sums=('309aad96b89443a5d7eb0b52cc5708cc256f3074fad0a489a620e1ab225f6e54')
sha256sums_x86_64=('ae2430020120edafa2f456eb9cb992863a72c538b514f5a9cf963f5aae590fd2')
sha256sums_aarch64=('5600f41708574c04b3f4ab48ed8ec6ecbe92c065c6eaa64cc5ed8615092818e9')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/seqfu"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
