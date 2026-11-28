# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=osu-collect-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="osu!collector collection downloader and updater"
arch=('x86_64')
url="https://github.com/uwuclxdy/osu-collect"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/uwuclxdy/osu-collect/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/osu-collect-linux-x64")
sha256sums=('429c026d4b5ffeb625f1277ee0fd65d5a7b2808a7ea6399dd0f4534373c58ec5')
sha256sums_x86_64=('7624fb53d6737a1cb489ad9e36ffa9291f5aa6153c83fbe2ec65b8d9e6205272')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/osu-collect"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
