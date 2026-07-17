# Maintainer: theesfeld
# Auto-updated on release by GitHub Actions.
pkgname=f00
pkgver=0.10.5
pkgrel=1
pkgdesc="Modern, friendly directory lister (ls rewrite in Rust)"
arch=('x86_64' 'aarch64')
url="https://f00.sh"
license=('MIT' 'Apache')
depends=('glibc' 'gcc-libs')
provides=('f00')
source_x86_64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('444a44569e2bd79e843b62ed08769d7aa8c0da572d1b5e8716d5e5ec1beaa7ac')
sha256sums_aarch64=('2e868d2b1d0b23c6c1fefbb782fe356c0dd1f8924bb48f44040b05a0cbadfe38')

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
