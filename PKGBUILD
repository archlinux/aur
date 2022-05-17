# Maintainer: knthmn <knthmn at outlook dot com>
pkgname=resticprofile-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Configuration profiles for restic backup. Pre-compiled"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/creativeprojects/resticprofile"
license=('GPL3')
depends=(
  'restic'
)
provides=('resticprofile')
conflicts=('resticprofile')

source_x86_64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("https://github.com/creativeprojects/resticprofile/releases/download/v${pkgver}/resticprofile_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('8bd7efd33d83bba03001cb24d55b01f6badea04cdaf8da09af504f17d27b72d6')
sha256sums_aarch64=('aa9f5be5acd67c0332770e0e6b8fa57f26b53593bbca4d5cf5cc1da6ea2b07f8')
sha256sums_armv6h=('3a31d963fb661148ca3e37e979009dce4be4371742b2d607aad496a93a8f42c2')
sha256sums_armv7h=('dfb582764223698a30213b32c7a188d21653d1c25e33b6163c057c991685c9cc')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
