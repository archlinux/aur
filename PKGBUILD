# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zihuan-next-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Customizable AI agent platform"
arch=('x86_64')
url="https://github.com/FredYakumo/zihuan-next"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++' 'openssl-3' 'xz')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FredYakumo/zihuan-next/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/zihuan_next-v${pkgver}-Linux-x86_64-cpu.tar.xz")
sha256sums=('4df3c306dddaaf4baffdff5ca820cc679ac8cd6dc263c6a74517783e42fa7a3b')
sha256sums_x86_64=('e5b77473259745310102c0a73b334dead64eea5d1a43e11dc20dd6615be79ed9')

package() {
  install -Dm755 "zihuan_next/zihuan_next" "${pkgdir}/usr/bin/zihuan_next"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
