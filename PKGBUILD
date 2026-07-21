# Maintainer: theesfeld
# Auto-updated on release by GitHub Actions.
pkgname=f00
pkgver=0.12.0
pkgrel=1
pkgdesc="Modern, friendly directory lister (ls rewrite in Rust)"
arch=('x86_64' 'aarch64')
url="https://f00.sh"
license=('MIT' 'Apache')
depends=('glibc' 'gcc-libs')
provides=('f00')
source_x86_64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('56cfe2cc177ff9f1b45303359762ef82e53c4154d5ea90c3fba13d1ba3f48b66')
sha256sums_aarch64=('e426d203300fcd5ecc10b7a7bc33c73f2daa81cb38d9673c4b00b5a2a62e5d7e')

package() {
  local dir
  if [[ "${CARCH}" == "x86_64" ]]; then
    dir="f00-x86_64-unknown-linux-gnu"
  else
    dir="f00-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${srcdir}/${dir}/f00" "${pkgdir}/usr/bin/f00"
  if [[ -f "${srcdir}/${dir}/LICENSE-MIT" ]]; then
    install -Dm644 "${srcdir}/${dir}/LICENSE-MIT" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  fi
  if [[ -f "${srcdir}/${dir}/LICENSE-APACHE" ]]; then
    install -Dm644 "${srcdir}/${dir}/LICENSE-APACHE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  fi
}
