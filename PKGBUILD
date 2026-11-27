# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cortexdb-bin
pkgver=2.174.0
pkgrel=1
pkgdesc="Local-first AI agent memory with a knowledge graph in one SQLite file"
arch=('x86_64' 'aarch64')
url="https://github.com/liliang-cn/cortexdb"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/liliang-cn/cortexdb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cortexdb-grpc_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cortexdb-grpc_linux_arm64.tar.gz")
sha256sums=('d9d06b2de5041e1de210cfbcf4fffcc7ae8bf4e151a1925285105a6794e0cde5')
sha256sums_x86_64=('8ebf14dd1a86122c92d9e8f3fc8f4cf0680699990412e886af2acf976149883a')
sha256sums_aarch64=('cd2864091337fcacdf7ac75376fee46674ce8f73c8b5ee46e91c2e03aac97ece')

package() {
  install -Dm755 "cortexdb-grpc" "${pkgdir}/usr/bin/cortexdb-grpc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
