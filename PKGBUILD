# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mxr-bin
pkgver=0.6.248
pkgrel=1
pkgdesc="Local-first email client with Vim-style navigation, multi-account sync, and full-text search"
arch=('x86_64')
url="https://github.com/planetaryescape/mxr"
license=('MIT OR Apache-2.0')
depends=('alsa-lib' 'dbus' 'glibc' 'libgcc' 'libstdc++' 'openssl-3' 'pcre2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mxr-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('b68b2b3882ab13604e84d852efd3ad398d3879e71f5cc4cbb3b90929d9764771')

package() {
  install -Dm755 "mxr-mailmerge" "${pkgdir}/usr/bin/mxr-mailmerge"
  install -Dm755 "mxr-chime-player" "${pkgdir}/usr/bin/mxr-chime-player"
  install -Dm755 "mxr" "${pkgdir}/usr/bin/mxr"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
