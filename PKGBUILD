# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=waveloom-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Terminal coding agent optimized for DeepSeek prefix caching"
arch=('x86_64' 'aarch64')
url="https://github.com/Menfre01/waveloom"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Menfre01/waveloom/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/waveloom_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/waveloom_linux_arm64.tar.gz")
sha256sums=('64f7ff5bbe686f5cd9efeb0ba5cf78040823fa67147aaa6169178d2b918da0ba')
sha256sums_x86_64=('b85fbe7f73fe999ede1e75f0601d0e088c83431ec54dc503c710f3232e0421b0')
sha256sums_aarch64=('393eb67fb4b1f9183c9b8d58f886da1c76fb6c65bedcb4c5a62ae3a855794c23')

package() {
  install -Dm755 "waveloom" "${pkgdir}/usr/bin/waveloom"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
