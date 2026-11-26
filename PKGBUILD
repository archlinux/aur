# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=certgraph-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="OSINT tool that crawls the graph of certificate alternate names"
arch=('x86_64' 'aarch64')
url="https://github.com/lanrat/certgraph"
license=('GPL-2.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/certgraph_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/certgraph_linux_arm64.tar.gz")
sha256sums_x86_64=('0245801ed916d248f861385af7ccc7a6865a280d627221568170c9867543ef02')
sha256sums_aarch64=('3ba5e34d282f757600f05a300f4c99fa707e1c4bfeb896e82b6a858f6670f694')

package() {
  install -Dm755 "certgraph" "${pkgdir}/usr/bin/certgraph"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
