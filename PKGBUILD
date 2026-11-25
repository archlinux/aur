# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=monoscope-bin
pkgver=0.6.32
pkgrel=1
pkgdesc="Monoscope lets you ingest and explore your logs, traces and metrics"
arch=('x86_64' 'aarch64')
url="https://github.com/monoscope-tech/monoscope"
license=('AGPL-3.0-only')
depends=('glibc' 'gmp' 'ncurses' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/monoscope-tech/monoscope/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/monoscope-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/monoscope-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('4eacffadafc3c95566964b45d4d944a5403ddfe86cd27596ab0ac980ccd47265')
sha256sums_aarch64=('2d19d04a631f2dcb28ac8a2e11058375228b4a9bbf1438fdb4601292280788ba')

package() {
  install -Dm755 "monoscope" "${pkgdir}/usr/bin/monoscope"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
