# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=moli-bin
pkgver=1.1.25
pkgrel=1
pkgdesc="Best headless browser for AI agents. Lite, Fast, High-Compatibility."
arch=('x86_64')
url="https://github.com/lexmount/moli"
license=('MIT' 'APACHE')
depends=('libpng' 'brotli' 'bzip2' 'expat' 'freetype2' 'fontconfig')
provides=('moli')
conflicts=('moli' 'moli-git')
source=("moli-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/lexmount/moli/releases/download/v${pkgver}/moli-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('04c73204626054c9ec0064f7fc00abb0dcfa7f8b9c3ec9df5de8e2afc301087f')
options=(!strip)

package() {
  local _dir="moli-v${pkgver}-x86_64-unknown-linux-gnu"
  install -D -m755 "${srcdir}/${_dir}/moli" "${pkgdir}/usr/bin/moli"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -D -m644 "${srcdir}/${_dir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
