# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cortexdb-bin
pkgver=2.170.0
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
sha256sums_x86_64=('2c841a3769322a0363840dc151fb8f73b9cba904defbe07ec2c191aa3cfec9e9')
sha256sums_aarch64=('f6628f54b7cb7884990510ef0bbd192dce2f9543b9c3336a53dc4835b85115e3')

package() {
  install -Dm755 "cortexdb-grpc" "${pkgdir}/usr/bin/cortexdb-grpc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
