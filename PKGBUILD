# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=moli-bin
pkgver=1.1.20
pkgrel=1
pkgdesc="Best headless browser for AI agents. Lite, Fast, High-Compatibility."
arch=('x86_64')
url="https://github.com/lexmount/moli"
license=('MIT' 'APACHE')
depends=('libpng' 'brotli' 'bzip2' 'expat' 'freetype2' 'fontconfig')
provides=('moli')
conflicts=('moli' 'moli-git')
source=("moli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/lexmount/moli/releases/download/v${pkgver}/moli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ef8b7b293dad862185d03aed59fc3110d5dbd4a4938573a4e7ac345508c85180')
options=(!strip)

package() {
  local _dir="moli-v${pkgver}-x86_64-unknown-linux-gnu"
  install -D -m755 "${srcdir}/${_dir}/moli" "${pkgdir}/usr/bin/moli"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
