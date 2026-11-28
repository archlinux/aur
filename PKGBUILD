# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=c9watch-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Monitor Claude Code, Codex, Cursor Agent and Pi sessions on your machine"
arch=('x86_64' 'aarch64')
url="https://github.com/minchenlee/c9watch"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/minchenlee/c9watch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/c9watch-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/c9watch-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('59fb4077012e9ff40d6d25396a3c028895472aa630cbbdafb7bdc053a67d7da0')
sha256sums_x86_64=('1c37dd1ea8cf2808c55598880c4fef70d9419f77213fc0679a6b7c17c749d2f7')
sha256sums_aarch64=('bdcdfba85a4f73491cf509218eba4b574dc213617e4f8e4bef7a9ce09e4912cb')

package() {
  install -Dm755 "c9watch" "${pkgdir}/usr/bin/c9watch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
