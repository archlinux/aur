# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=moli-bin
pkgver=1.1.19
pkgrel=1
pkgdesc="Best headless browser for AI agents. Lite, Fast, High-Compatibility."
arch=('x86_64')
url="https://github.com/lexmount/moli"
license=('MIT' 'APACHE')
depends=('libpng' 'brotli' 'bzip2' 'expat' 'freetype2' 'fontconfig')
provides=('moli')
conflicts=('moli' 'moli-git')
source=("moli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/lexmount/moli/releases/download/v${pkgver}/moli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5c22362065e64e6de785274f6b3f28a735fca363abf9896c48733e5f58489def')
options=(!strip)

package() {
  local _dir="moli-v${pkgver}-x86_64-unknown-linux-gnu"
  install -D -m755 "${srcdir}/${_dir}/moli" "${pkgdir}/usr/bin/moli"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
