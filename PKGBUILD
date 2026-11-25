# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wassette-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Security-oriented runtime that runs WebAssembly Components via MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/wassette"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/microsoft/wassette/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wassette_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wassette_${pkgver}_linux_arm64.tar.gz")
sha256sums=('fd532481d828e13a0b13ccb598e02338a3617740675a862ee6bdc1541b68e93d')
sha256sums_x86_64=('2a421a73c700798076507df27fbbb25ce4d35862c6b09c4a3fd7297e00c45736')
sha256sums_aarch64=('4081cfcff1de59e4e57455eb813b7a4e831133185f58e16fee14dea44e3a8731')

package() {
  install -Dm755 "wassette" "${pkgdir}/usr/bin/wassette"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
