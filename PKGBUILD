# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pikoci-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight CI/CD server"
arch=('x86_64' 'aarch64')
url="https://github.com/PikoCI/pikoci"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/PikoCI/pikoci/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pikoci-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/pikoci-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2acaadad9c05190e5b741a6d47967933c11dc11a4bbb7fb2b7dc3f006fb6d31a')
sha256sums_aarch64=('3a9b8034cee8b5b9797f1f37f5038941a620c87f615336a8134a21e7e9d87109')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pikoci"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
