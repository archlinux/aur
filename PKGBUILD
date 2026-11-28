# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=buildevents-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Generate Honeycomb traces from CI builds"
arch=('x86_64' 'aarch64')
url="https://github.com/honeycombio/buildevents"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/honeycombio/buildevents/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/buildevents-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/buildevents-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('223dc72d093b2be5e5149b7e620841358bba523031b51197704d799cc8de2211')
sha256sums_aarch64=('53453bedd714e6cdb3891c539aa52475c8de025f8b70dbc5a6cba12b0bc0d8e5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/buildevents"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
