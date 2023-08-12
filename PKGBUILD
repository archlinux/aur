# Maintainer: Kent Hou Man <knthmn0 at gmail dot com>
pkgname=resticprofile-bin
pkgver=0.23.0
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

sha256sums_x86_64=('422afc41cea5fdd9ab872d89391a773073f2dc0461d336c752e3f95ae8d8e0c3')
sha256sums_aarch64=('c25d0b3cdf85b230fcde46db0f7b6a413517e5632671f914e9ef37a1a8bd0ee3')
sha256sums_armv6h=('38f019452ec22e11e1012b25fca3955218c813302f480c4c69affd383c3488da')
sha256sums_armv7h=('25755f59ddfee0d5b6f442de6e1220896b88fe174242dfeb7ea6fe2e68bfc3c2')

package() {
  install -Dm755 "${srcdir}/resticprofile" "${pkgdir}/usr/bin/resticprofile" 
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/resticprofile/README.md"
}
