# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skilllite-bin
pkgver=0.1.30
pkgrel=1
pkgdesc="Lightweight sandboxed self-evolution engine for AI agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/EXboys/skilllite"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/EXboys/skilllite/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/skilllite-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/skilllite-linux-arm64.tar.gz")
sha256sums=('043dcb176e45d50f486d8e436fbb7419314c5b8664dbd92b5e3a8fd20a4dad09')
sha256sums_x86_64=('77ab563af5e69c156df1a39bb96ec67687cf652d8e945fb02ce81ae714ce50ba')
sha256sums_aarch64=('63d4a439b95e6998bb2eb1f02e4685a511b92350d07ca2f027f2b2c49ea58798')

package() {
  install -Dm755 "skilllite" "${pkgdir}/usr/bin/skilllite"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
