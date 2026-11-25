# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tutor-bin
pkgver=22.0.4
pkgrel=1
pkgdesc="Docker-based Open edX distribution"
arch=('x86_64')
url="https://github.com/overhangio/tutor"
license=('AGPL-3.0-only')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/overhangio/tutor/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tutor-Linux_x86_64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('325025e9b134f8c31c659138be4488c628b6250a15fdc237c622b0edf6b47472')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tutor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
