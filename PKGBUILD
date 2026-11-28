# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-fast-cdn-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple self-hosted CDN"
arch=('x86_64' 'aarch64')
url="https://github.com/kevinanielsen/go-fast-cdn"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/go-fast-cdn_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/go-fast-cdn_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('93686f315b4ac18b7c35ede1e1f58fb56ec78d02f10fe1160b6af78c48f3e2b4')
sha256sums_aarch64=('f918fa911d14ab0d9dd6fc3f2ca6bec8e8888e62927b71541d5511343c981c97')

package() {
  install -Dm755 "go-fast-cdn" "${pkgdir}/usr/bin/go-fast-cdn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
