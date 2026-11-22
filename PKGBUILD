# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hustle-tracker-bin
pkgver=0.4.20
pkgrel=1
pkgdesc="A privacy-first TUI to track what apps you use and how long you spend on them"
arch=('x86_64')
url="https://github.com/adolfousier/hustle-tracker"
license=('MIT')
depends=('glibc' 'libgcc' 'libx11' 'libxcb' 'libxtst')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/adolfousier/hustle-tracker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/hustle_tracker-linux-x86_64")
sha256sums=('d5737e8e3680c0f1a72cf8bdd7faad19ef8cfd6192a0897622965cc941b4a202')
sha256sums_x86_64=('73283ec7735fda1c46d62a64d4bce2d57b71e3e3d8316e82ca0f772eaa475384')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/hustle_tracker"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
