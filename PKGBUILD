# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chrome-agent-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Compile web tasks into repeatable browser automation"
arch=('x86_64' 'aarch64')
url="https://github.com/sderosiaux/chrome-agent"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sderosiaux/chrome-agent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/chrome-agent-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/chrome-agent-linux-arm64")
sha256sums=('5baddb7cc3c01d44d8d712fbad6ced20905bc23b777ea52949a832cbb27678d5')
sha256sums_x86_64=('ba8a32fd550d2af36ede3bd80f2012559a363264d817c7dc3df53a94ecbb63b6')
sha256sums_aarch64=('0f9d3cb7145b0d2db2c76f8d727dcd7cd1bf13030670dbc0ceb6b367416867bd')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chrome-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
