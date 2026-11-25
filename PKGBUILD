# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-enum-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Enum generator for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/abice/go-enum"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/abice/go-enum/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/go-enum_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-go-enum::${_dl}/go-enum_Linux_aarch64"
            "${pkgname}-${pkgver}-aarch64-go-enum::${_dl}/go-enum_Linux_arm64")
sha256sums=('5494d56236ba15978fdaf62662ee16cabceb505ce20a7d6a725a94c057226a52')
sha256sums_x86_64=('d1a4ef83a729f2184f19e85446b6acfea07d25047bf4ef8b5e8e6c0d0c2ffff9')
sha256sums_aarch64=('0b9fd7f291c6383b2438472215b2fab8c6db37eb4c57011901ac5bc0d3d5fdfc' '0b9fd7f291c6383b2438472215b2fab8c6db37eb4c57011901ac5bc0d3d5fdfc')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/go-enum"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
