# Maintainer: Kent Hou Man <knthmn0 at gmail dot com>
pkgname=resticprofile-bin
pkgver=0.31.0
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

sha256sums_x86_64=('bcff7fa42b032f908eb20a0c3d65bc80e78cae05a33ab02a799f94391db7de2e')
sha256sums_aarch64=('4a0b8ea222d20502d81c8d957114340727f3b49f0e3ffa56c12bed040379b44f')
sha256sums_armv6h=('f654692af84c63560123e71c5170ce4ce7a5d5dab1eefecd5d6034a27b2fd416')
sha256sums_armv7h=('395910b7aaf60209feabe4c9c475c831d41304303778dff37d5687aea7e5a3a7')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
