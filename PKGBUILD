# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reostream-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="Reolink camera proxy serving RTSP and HTTP for NVRs"
arch=('x86_64' 'aarch64')
url="https://github.com/VoltTech21/reostream"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/VoltTech21/reostream/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/reostream-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/reostream-linux-arm64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('507acac9a323bf4ff8438bfd6f829d0b25a2dfc7f4b3c94cb8878da3ca9b50d6')
sha256sums_aarch64=('5515547d21fb99fc84d76b5e4bcc87dd0bc25ba6078f802345047b36ace1f6fd')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/reostream"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
