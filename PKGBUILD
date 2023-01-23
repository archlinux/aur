# Maintainer: knthmn <knthmn at outlook dot com>
pkgname=resticprofile-bin
pkgver=0.20.0
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

sha256sums_x86_64=('8b8342cde29d498628ba8c5a83ca881fbcd30831ddbfb3cc3bf666a1e353f7e7')
sha256sums_aarch64=('8b3659b3125a6cbf9e568b1a66246502bda54eec55588038c15f3f2e6484b7e9')
sha256sums_armv6h=('7b014b6b565ae6e258644ee24575d9d3465d805d4281e24dc69252ad6fbcb2ff')
sha256sums_armv7h=('5b5b8ecbeea0d755aa3f9aff2acbcb4f2031f02e1eb0bced0f648427ce54fa4a')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
