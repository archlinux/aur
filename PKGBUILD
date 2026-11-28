# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flipflop-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Local file sharing between nearby devices"
arch=('x86_64')
url="https://github.com/andunieee/flipflop"
license=('AGPL-3.0-only')
depends=('dbus' 'fontconfig' 'freetype2' 'glibc' 'libgcc' 'libglvnd' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/andunieee/flipflop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flipflop-linux-x86_64-v${pkgver}.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('bffb371568f7996d4baf9e6185e14867929996107c558e730169552fe2611ce2')

package() {
  install -Dm755 "flipflop/bin/flipflop-gui" "${pkgdir}/usr/bin/flipflop-gui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
