# Maintainer: Kent Hou Man <knthmn0 at gmail dot com>
pkgname=resticprofile-bin
pkgver=0.26.0
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

sha256sums_x86_64=('bb2b566185f684a55134035b3f4738c9f3f4605aa67b847bdcecd94bd311263f')
sha256sums_aarch64=('9b3b1e027a29b3bfe2e4ad59b241f6e17b3896a05dc4f1b0cd35eddb62deafd5')
sha256sums_armv6h=('b74dcbbc4d110dd3fd28bbf8b954fd99292c6f8335aee3d5fa64322bf670d3e3')
sha256sums_armv7h=('3b14d7286eb34624b68d021d16f11eafa678f7b57bdd73c2a570d3bec5668fd7')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
