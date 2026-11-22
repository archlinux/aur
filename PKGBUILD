# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kimun-bin
pkgver=0.25.3
pkgrel=1
pkgdesc="A terminal-based Markdown note taking app that combines an interactive TUI with a scriptable CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/nico2sh/kimun"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="kimun-notes-v${pkgver}"
_dl="${url}/releases/download/${_tag}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nico2sh/kimun/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kimun-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kimun-linux-arm64.tar.gz")
sha256sums=('92915d0f2c5e1fbc3c7e8966b46759f8d0504f1501fb7912fb4b79cfdbc54c0e')
sha256sums_x86_64=('43dc8b7e794ebb2cf9d9ae7ef99b5318cecc7483c370dc60e08c454871a71e60')
sha256sums_aarch64=('fc618ddac72f726b38888ffeb7efba81d039c53db7085d57e8290d971fc7ce1f')

package() {
  install -Dm755 "kimun" "${pkgdir}/usr/bin/kimun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
