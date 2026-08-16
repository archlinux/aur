pkgname=alibaba-cloud-client-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='Alibaba Cloud Client for Linux (unofficial binary conversion)'
arch=('x86_64')
url='https://github.com/acgq/alibaba-cloud-client-linux'
license=('custom:upstream')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cups'
  'gtk3'
  'libdrm'
  'libxkbcommon'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
)
optdepends=('xdg-utils: desktop integration helpers')
provides=("alibaba-cloud-client=$pkgver")
conflicts=('alibaba-cloud-client')
options=('!strip')
source=("https://github.com/acgq/alibaba-cloud-client-linux/releases/download/v${pkgver}-${pkgrel}/alibaba-cloud-client-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("alibaba-cloud-client-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('9a789c8bb642feb194c1967edf052942ea5929ab3bdab8aacee54f4a8aaa2d4c')

package() {
  bsdtar --no-same-owner \
    -xf "$srcdir/alibaba-cloud-client-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" \
    -C "$pkgdir"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
