# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dagster-bin
pkgver=1.13.31
pkgrel=1
pkgdesc="An orchestration platform for the development, production, and observation of data assets"
arch=('x86_64')
url="https://github.com/dagster-io/dagster"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dagster-io/dagster/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/create-dagster-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('e25b0c5be442bdf543e3f179ef0ae6a5edef5f5c70524fce00a2a657f5d3ed9d')
sha256sums_x86_64=('8b2ebaff3a9ad639c622ee3947dcb1b9097eedf54946bfe86bf5166dce7319b0')

package() {
  install -Dm755 "create-dagster-x86_64-unknown-linux-gnu/create-dagster" "${pkgdir}/usr/bin/create-dagster"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
