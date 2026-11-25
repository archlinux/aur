# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=subwave-bin
pkgver=1.34.0
pkgrel=1
pkgdesc="Personal internet radio: Agentic AI DJ"
arch=('x86_64' 'aarch64')
url="https://github.com/perminder-klair/subwave"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/perminder-klair/subwave/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/subwave-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/subwave-linux-arm64")
sha256sums=('0735adbd0d3294cc8b3f498f345d22a3b605b9a5be6ddf28eebc6d96a62d3406')
sha256sums_x86_64=('48b4c073c995326bea3fb0743bf8a9f34011f62d263a456bbb8b4c431cef1e8a')
sha256sums_aarch64=('829f10efba70784c3edb385895f4e465dedf2b1d70f4f7e665a0e7f2bd0917c7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/subwave"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
