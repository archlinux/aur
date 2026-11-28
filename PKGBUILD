# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dockerfile-security-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Static security checker for Dockerfiles"
arch=('x86_64' 'aarch64')
url="https://github.com/cr0hn/dockerfile-security"
license=('BSD-3-Clause')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cr0hn/dockerfile-security/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dockerfile-sec-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/dockerfile-sec-linux-arm64")
sha256sums=('608239bf548f6fffe0546f9f1d16e328fd01968c3cc56b9c57952b476168b28c')
sha256sums_x86_64=('28f7f3aef4cba4162c799ec717b19e0f967b09d4ff06e5195bbfa4d00fbbac0e')
sha256sums_aarch64=('581672e2f59b02b181700d1c72b386ed237606d412c3cdb2214f6d4cb9002cb6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dockerfile-sec"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
