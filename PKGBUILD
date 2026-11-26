# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nylon-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Self-healing WireGuard mesh"
arch=('x86_64' 'aarch64')
url="https://github.com/encodeous/nylon"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/encodeous/nylon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nylon-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nylon-linux-arm64.tar.gz")
sha256sums=('cdd63acb78334fa2960faac2d54fc3b55f550baeec3a84553aee7af9f0bb5b43')
sha256sums_x86_64=('bd12fa050e2573a81d827fba239d8d06b3e9fbf4c8d64880d175ba815b341f0a')
sha256sums_aarch64=('57ca27807c4363f12f301704809877b1de5e82bc87fdf3cc0e8766789a6db22e')

package() {
  install -Dm755 "nylon" "${pkgdir}/usr/bin/nylon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
