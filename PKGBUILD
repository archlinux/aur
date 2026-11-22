# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=maelstrom-tui-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A fast test runner that runs every test in its own container locally or distributed"
arch=('x86_64' 'aarch64')
url="https://github.com/maelstrom-software/maelstrom"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/maelstrom-software/maelstrom/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/maelstrom-run-x86_64-unknown-linux-gnu.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/maelstrom-run-aarch64-unknown-linux-gnu.tgz")
sha256sums=('23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')
sha256sums_x86_64=('bd825aa0e61de698615a0da30ef207e93145bf8e7ba4ae67c95a02482469d927')
sha256sums_aarch64=('43dec6f87d6e05ed3692a7cbe93dd67c73d6b97621ef30cfa9dd549b5c9ca794')

package() {
  install -Dm755 "maelstrom-run" "${pkgdir}/usr/bin/maelstrom-run"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
