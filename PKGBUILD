# Maintainer: agony <27015 at riseup dot net>

pkgname=c2patool-bin
pkgver=0.29.0
pkgrel=1
pkgdesc='Tool for displaying and creating C2PA manifests (prebuilt)'
arch=('x86_64')
url='https://github.com/contentauth/c2patool'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("c2patool=${pkgver}")
conflicts=('c2patool')
source=("c2patool-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/contentauth/c2patool/v${pkgver}/LICENSE-MIT")
source_x86_64=("c2patool-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('89375a50de90d2dcaa04406086da832ad452ebcaf6ab402ef3d51b8401a67c71')
sha256sums_x86_64=('af5494722fc8c3f239980f36ceb3acf496d1481850d356a4bb34777b33b08043')

package() {
  install -Dm755 c2patool/c2patool -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/c2patool-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
