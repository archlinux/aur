# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chipnomad-tracker-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Chiptune tracker for handheld consoles"
arch=('x86_64')
url="https://github.com/Megus/chipnomad-tracker"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl2-compat')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Megus/chipnomad-tracker/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ChipNomad-2026-08-29-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('05c5a3b01343b6fc828033c2996ff987e4140ccc7a348fdb8ec3a758a88010ab')
sha256sums_x86_64=('a7f2d589f6af89327ff13999d426ca1e64ff3786d0275c1404163d3b5211fb35')

package() {
  install -Dm755 "ChipNomad-Linux/chipnomad" "${pkgdir}/usr/bin/chipnomad"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
