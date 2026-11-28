# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=econumo-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Personal and family budgeting app with multi-currency support"
arch=('x86_64' 'aarch64')
url="https://github.com/econumo/econumo"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/econumo/econumo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/econumo-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/econumo-linux-arm64")
sha256sums=('4b2b4190ca6c35ffeab5904b22dce04805237196e9d381a365bc3c510c01d402')
sha256sums_x86_64=('42dea8793b6588225a02ebd52a7342571e4c38e9a7cb14a1ebef501616069f02')
sha256sums_aarch64=('a42e156e8094bc26e8db22a930d6d348508a08c4366738467714d42a431a8eb5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/econumo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
