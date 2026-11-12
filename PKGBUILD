# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=moli-bin
pkgver=1.1.24
pkgrel=1
pkgdesc="Best headless browser for AI agents. Lite, Fast, High-Compatibility."
arch=('x86_64')
url="https://github.com/lexmount/moli"
license=('MIT' 'APACHE')
depends=('libpng' 'brotli' 'bzip2' 'expat' 'freetype2' 'fontconfig')
provides=('moli')
conflicts=('moli' 'moli-git')
source=("moli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/lexmount/moli/releases/download/v${pkgver}/moli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('09e54e48be914df9596e8b9046cd2e1c67d5911761a09b0445488dd5d39c56d6')
options=(!strip)

package() {
  local _dir="moli-v${pkgver}-x86_64-unknown-linux-gnu"
  install -D -m755 "${srcdir}/${_dir}/moli" "${pkgdir}/usr/bin/moli"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
