# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kimun-bin
pkgver=0.25.4
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
sha256sums_x86_64=('262733df65ed43474b6079c979899115c6a1d13a6a6c23deb4646f4f98698806')
sha256sums_aarch64=('acbe7040aa8471c2db4431d838c344f0a7fe8fc5329b790841af961dde5975ca')

package() {
  install -Dm755 "kimun" "${pkgdir}/usr/bin/kimun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
