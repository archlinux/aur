# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mosdns-x-bin
pkgver=26.05.25
pkgrel=1
pkgdesc="DNS forwarder with a customizable pipeline"
arch=('x86_64' 'aarch64')
url="https://github.com/pmkol/mosdns-x"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/mosdns-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/mosdns-linux-arm64.zip")
sha256sums_x86_64=('1e5673d22b753f87e890b59390b053ecfc301942ddec0755c93b2b907cfb7256')
sha256sums_aarch64=('322209b72b8f5d0f5b425e331bc6e5330e443f3c449971546505e24fa7dbde33')

package() {
  install -Dm755 "mosdns" "${pkgdir}/usr/bin/mosdns"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
