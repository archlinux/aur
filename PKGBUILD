# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bake-rs-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple script runner"
arch=('x86_64' 'aarch64')
url="https://github.com/ali77gh/bake-rs"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ali77gh/bake-rs/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bake-Linux-musl-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bake-Linux-musl-arm64.tar.gz")
sha256sums=('aa5d988bd787d8ea19fdb55a16361f6d2a7203c62e3c7115f7c387ea837821ef')
sha256sums_x86_64=('278e4895d20275a5f5d103bfc3a1ba77e95fd01b9117b89fe8e45b5971ad4e9b')
sha256sums_aarch64=('4b1957896a25e5fd7a4c42f2689b4613d7bbe3c06d1cf9eba39e5ea623fff1e8')

package() {
  install -Dm755 "bake" "${pkgdir}/usr/bin/bake-rs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
