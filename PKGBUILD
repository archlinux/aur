# Maintainer: Kent Hou Man <knthmn0 at gmail dot com>
pkgname=resticprofile-bin
pkgver=0.24.0
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

sha256sums_x86_64=('0af04fa60074002fdd99b1c784c7ce2af04ca3e6bfa5d6a6401ea8361a88b153')
sha256sums_aarch64=('eca763b2860bc1eacdf26818bb103358e786dd245c0be51548639f551a5c5453')
sha256sums_armv6h=('4c3085d70b66473e56d5da49d0ef475a24aef1d96da271eb4371f0025d4e0f4e')
sha256sums_armv7h=('164989602fdb4d595d6181aba5c1f0af0abcade47154d60818c57f7c3e9bf967')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
