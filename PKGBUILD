# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cf-scanner-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Cloudflare IP scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/radioactiveAHM/cf-scanner"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/radioactiveAHM/cf-scanner/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cf-scanner_Linux_x86_64v1.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cf-scanner_Linux_arm64.tar.gz")
sha256sums=('e94e3918b02ba37c39ff3cfee0f1807883b930206406ec4a1bf3591542b1e26b')
sha256sums_x86_64=('1aeff747cd6f101fe8c832349a6715464f476d4f80f9a2fbac072fb58bd8326a')
sha256sums_aarch64=('83f0e30acc64358bdc285405543361a05e01400ea8a7f7e5702b0d849f9a363d')

package() {
  install -Dm755 "cf-scanner" "${pkgdir}/usr/bin/cf-scanner"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
