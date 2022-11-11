# Maintainer: knthmn <knthmn at outlook dot com>
pkgname=resticprofile-bin
pkgver=0.19.0
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

sha256sums_x86_64=('df27b770737c47f91e04bc48936726eef48f3c676c814690e831b4f94729137f')
sha256sums_aarch64=('12f4ecc4bc9b345afc4275e34acc303af0b09ccc6552f4f3096f8928e8876794')
sha256sums_armv6h=('0075fd07b6892541d06e65eecf14b1b18397caf6afe9efe67ca5163272b289ba')
sha256sums_armv7h=('60670e22bdedd3f4a2e71ce2ecd46caeeceffe475ba18a5bf9ecaf8d7c336129')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
