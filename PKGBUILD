# Maintainer: knthmn <knthmn at outlook dot com>
pkgname=resticprofile-bin
pkgver=0.16.0
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

sha256sums_x86_64=('eb3fc7c2d0fa73dc4fa4334a65ca6edc5dfe609e109b5cbfb5db00db33f90a8d')
sha256sums_aarch64=('5ae686686ed35fbc364932876536c80a855b04242ff1e18286cb36f33be4fb1c')
sha256sums_armv6h=('8db37c08e270e7462f299c3a29e573cdebc5d4095d2bdbb4bb6fed788f732295')
sha256sums_armv7h=('b1e23f6f190c9650321155e1f056cdaf8bc8fbf54f1678fdfe2515df8300f412')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
