# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pktz-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="eBPF-powered per-process network traffic monitor"
arch=('x86_64' 'aarch64')
url="https://github.com/immanuwell/pktz"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/immanuwell/pktz/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pktz-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/pktz-linux-arm64")
sha256sums=('77b9b0694738e9355855bb7f021d0425ec22b7d58fa9d8b99b0e97067db54a29')
sha256sums_x86_64=('6160f7aea4931acabce1a578ac25f673dd91ca372899b55258f076b32d7e4195')
sha256sums_aarch64=('fcccf3ff0899473710973b810dd33952c738401b66cdc40b578bf836a7bd267c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pktz"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
