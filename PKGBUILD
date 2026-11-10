# Maintainer: Jasmeet (Jazz) Bhatia <jasmeet.bhatia.us@gmail.com>
pkgname=jerc-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Keyboard-driven terminal email client written in Rust (prebuilt static binary)'
arch=('x86_64')
url='https://github.com/HiFiveJazz/jerc'
license=('GPL-3.0-only')
depends=('ca-certificates')
optdepends=(
  'poppler: render PDF attachment previews with pdftoppm'
  'xdg-utils: open links in the default browser'
)
options=('!debug' '!strip')
provides=('jerc')
conflicts=('jerc')

_source_archive="jerc-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
source_x86_64=("${_source_archive}::${url}/releases/download/v${pkgver}/${_source_archive}")
sha256sums_x86_64=('f71be521121f5f4a5cfec6182c355771bb52663560288fb9f73ed6ed2f5868fd')

package() {
  local bundle="${srcdir}/jerc-v${pkgver}-x86_64-unknown-linux-musl"
  install -Dm755 "${bundle}/jerc" "${pkgdir}/usr/bin/jerc"
  install -Dm644 "${bundle}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${bundle}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${bundle}/config.example.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"
}
