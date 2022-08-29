# Maintainer: knthmn <knthmn at outlook dot com>
pkgname=resticprofile-bin
pkgver=0.18.0
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

sha256sums_x86_64=('1e929d9748341b3907f74b505db98963e6d0040607209b5cd4db2a5ecbbc0619')
sha256sums_aarch64=('1474316e7c55b44c34010f21762b5451b7552595a6bef75955642a45d635d8b9')
sha256sums_armv6h=('bb6d2de3c72527e3fa213878490d0969e9b2bf88c02c3d50b1c402472bb07a87')
sha256sums_armv7h=('d44240b9360b2d3566e80d5b3cba93808764390d70f83820b834bb5445c01714')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
