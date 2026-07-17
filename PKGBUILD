# Maintainer: theesfeld
# Auto-updated on release by GitHub Actions.
pkgname=f00
pkgver=0.10.4
pkgrel=1
pkgdesc="Modern, friendly directory lister (ls rewrite in Rust)"
arch=('x86_64' 'aarch64')
url="https://f00.sh"
license=('MIT' 'Apache')
depends=('glibc' 'gcc-libs')
provides=('f00')
source_x86_64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('060420f2af3efd73ef6a6acbaed940f9e52dea8f597c6dd0383f85a7e27e3c47')
sha256sums_aarch64=('0c0f6fd886da8099f086d037ddacd75c3fa51943068cd135397a13177b876cb3')

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
