# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wasi-vfs-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Virtual filesystem layer for WASI"
arch=('x86_64' 'aarch64')
url="https://github.com/kateinoigakukun/wasi-vfs"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kateinoigakukun/wasi-vfs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/wasi-vfs-cli-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/wasi-vfs-cli-aarch64-unknown-linux-gnu.zip")
sha256sums=('268872b9816f90fd8e85db5a28d33f8150ebb8dd016653fb39ef1f94f2686bc5')
sha256sums_x86_64=('c9ee8179f6f0882abc37024fbe0cd678311aa8a29083fa364915ed4d29a69485')
sha256sums_aarch64=('ef71666d26215121f7c49c1713ee029aa5ebe6ea41722013b41d488288cb0186')

package() {
  install -Dm755 "wasi-vfs" "${pkgdir}/usr/bin/wasi-vfs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
