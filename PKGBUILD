# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=statui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="API health check TUI dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/mohamed-badry/statui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mohamed-badry/statui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/statui-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/statui-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('d6b11628d92bc8529931d7ed4a7d33e7d05b5c87acc72f5a3048630ba729105b')
sha256sums_x86_64=('08f5c449f14367bf975e23a58cef123d629c4d3090ead43d724980f7ad90088c')
sha256sums_aarch64=('c76f4cb09a4bc498befec64a604dc9c518f6f2978282f1920b6fcffbfe6caa6b')

package() {
  install -Dm755 "statui" "${pkgdir}/usr/bin/statui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
